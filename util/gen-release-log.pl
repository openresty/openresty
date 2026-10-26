#!/usr/bin/perl
use strict;
use warnings;
use Cwd qw(abs_path);
use File::Basename qw(dirname);
use File::Spec;
use FindBin qw($RealBin);
use Getopt::Long;

sub sh (@);
sub check_repo ($);

my ($openresty_dir, $show_log, $log_only, $count, $mods, $new_tag, $old_tag,
    $force_pull);

GetOptions(
    'd=s' => \$openresty_dir,
    'm=s@' => \$mods, # module names
    'l' => \$show_log, # view git log since tag in current openresty
    'o' => \$log_only,
    'c' => \$count, # count git commits and compare the latest tag with current openresty
    'old-tag=s' => \$old_tag,
    'new-tag=s' => \$new_tag,
    'force-pull|f' => \$force_pull,
);

$openresty_dir //= File::Spec->catdir($RealBin, File::Spec->updir);
$new_tag //= "HEAD";

die "specifiy the --old-tag old tag for openresty"
    if !defined $old_tag;

check_repo($openresty_dir);
$openresty_dir = abs_path($openresty_dir);
my $repos_dir = dirname($openresty_dir);

my %repo_branch = (
    'luajit2' => 'v2.1-agentzh'
);

my $pretty_format = 'format:    * %s _Thanks %an for the patch._';

sub git_tags ($;$);
sub git_diff ($$);
sub git_tag ($$);

my $old_ref = git_tags($old_tag);
my $new_ref = git_tags($new_tag, $force_pull);
git_diff($old_ref, $new_ref);

sub check_repo ($) {
    my ($repo_name) = @_;

    die "Repository directory '$repo_name' does not exist\n"
        if !-d $repo_name;

    die "Directory '$repo_name' is not a Git repository\n"
        if !-e "$repo_name/.git";

    my $prefix = sh 'git', '-C', $repo_name, 'rev-parse', '--show-prefix';
    die "Directory '$repo_name' is not a Git repository root\n"
        if $prefix ne "";
}

sub git_tag ($$) {
    my ($repo_name, $ver) = @_;

    for my $tag ("v$ver", $ver) {
        my $found = sh 'git', '-C', $repo_name, 'tag', '-l', $tag;
        next if $found eq "";

        sh 'git', '-C', $repo_name, 'rev-parse', '--verify', "refs/tags/$tag^{commit}";
        return $tag;
    }

    die "Missing tag in repository '$repo_name': tried 'v$ver' and '$ver'\n";
}

sub git_tags ($;$) {
    my ($or_tag, $git_pull) = @_;

    my $tag_ref = {};

    # open my $fh, "<", $file or die "cannot open $file for read: $!";
    my @lines = do {
        my $data;

        if ($or_tag ne 'HEAD') {
            my $tag = git_tag($openresty_dir, $or_tag);
            $data = sh 'git', '-C', $openresty_dir, 'show',
                       "refs/tags/$tag:util/mirror-tarballs";
        } else {
            my $fh;
            open $fh, "<", "$openresty_dir/util/mirror-tarballs"
                or die "$!";
            $data = do { local $/; <$fh> };
            close $fh;
        }

        split /\r?\n/, $data;
    };

    my $ver;
    for (@lines) {
        if (m{^ver=([v\d.-]+(rc\d+)?)}) {
            $ver = $1;
        }

        if (!m{^#} && m{util/get-tarball "(https?://[^"]+)" -O "?([^\$]+)-\$ver}) {
            my ($repo, $name) = ($1, $2);

            # NB: https://people.freebsd.org/~osa/ngx_http_redis-$ver.tar.gz
            if ($name =~ m{^nginx|redis-nginx-module$}) {
                $ver = undef;
                next;
            }

            if (defined($mods) && !grep {$name eq $_} @$mods) {
                next;
            }

            my ($repo_addr) = $repo =~ m{^(https?://.*)/(archive|tarball)};
            my ($repo_name) = $repo_addr =~ m{/([^/]+)(?:.git)?$};
            my $repo_dir = File::Spec->catdir($repos_dir, $repo_name);

            check_repo($repo_dir);

            my $branch = sh 'git', '-C', $repo_dir, 'branch', '--show-current';
            my $is_clean = sh 'git', '-C', $repo_dir, 'status', '-s', '--untracked-files=no';
            my $br = $repo_branch{$repo_name} // 'master';

            if ($branch ne $br || $is_clean ne "") {
                die "Repository '$repo_name' has unexpected branch or tracked changes: "
                    . "branch '$branch', expected '$br', status '$is_clean'\n";
            }
            if ($git_pull) {
                sh 'git', '-C', $repo_dir, 'pull';
            }

            # real version
            my $tag = git_tag($repo_dir, $ver);

            $tag_ref->{$repo_name} = $tag;
        }
    }

    return $tag_ref;
}

sub git_diff ($$) {
    my ($old_ref, $new_ref) = @_;

    for my $repo_name (keys %$old_ref) {
        die "Missing component '$repo_name' in OpenResty '$new_tag'\n"
            if !exists $new_ref->{$repo_name};

        my $otag = $old_ref->{$repo_name};
        my $ntag = $new_ref->{$repo_name};
        my $repo_dir = File::Spec->catdir($repos_dir, $repo_name);
        if ($new_tag eq 'HEAD') {
            $ntag = sh 'git', '-C', $repo_dir, 'describe', '--abbrev=0', '--tags';
        }

        my $target_ref = "refs/tags/$ntag";

        if ($otag ne $ntag) {
            warn "# New Tag: $repo_name: $ntag(new) vs $otag";
            printf "* %s\t: From %s to %s.\n", $repo_name, $otag, $ntag;

            my $git_opt = $show_log ? '-p' : "--pretty=$pretty_format";
            my $log = sh 'git', '-C', $repo_dir, 'log', $git_opt,
                         "refs/tags/$otag..$target_ref";
            my @lines = sort grep {
                !/(Merge branch|bumped|Bump copyright date|update nginx to|upgrade nginx to|travis-ci:|tests:)/
            } split /\n/, $log;
            printf "%s\n", join "\n", @lines;

        } else {
            warn "# Pass: $repo_name: latest!";
        }
    }
}

sub sh (@) {
    warn "cmd: @_\n";

    open my $fh, '-|', @_ or die "Failed to run command '@_': $!\n";
    my $out = do { local $/; <$fh> };
    if (!close $fh) {
        die "Failed to run command '@_': ", $? >> 8, "\n";
    }

    $out //= "";
    chomp $out;
    return $out;
}
