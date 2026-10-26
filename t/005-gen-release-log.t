use strict;
use warnings;
use Cwd qw(abs_path getcwd);
use File::Copy qw(copy);
use File::Path qw(make_path);
use File::Temp qw(tempdir tempfile);
use FindBin;
use IPC::Open3;
use Test::More;

my $script = abs_path("$FindBin::Bin/../util/gen-release-log.pl");

local $ENV{GIT_CONFIG_NOSYSTEM} = 1;
local $ENV{GIT_CONFIG_GLOBAL} = '/dev/null';
local $ENV{GIT_AUTHOR_NAME} = 'Check Tag Test';
local $ENV{GIT_AUTHOR_EMAIL} = 'check-tag-test@example.invalid';
local $ENV{GIT_COMMITTER_NAME} = $ENV{GIT_AUTHOR_NAME};
local $ENV{GIT_COMMITTER_EMAIL} = $ENV{GIT_AUTHOR_EMAIL};

sub run_command {
    my ($dir, @command) = @_;
    my ($out) = tempfile(DIR => $dir, UNLINK => 1);
    my ($err) = tempfile(DIR => $dir, UNLINK => 1);
    my $previous_dir = getcwd();
    chdir $dir or die "chdir $dir: $!";
    my $stdin;
    my $pid = open3($stdin, '>&' . fileno($out), '>&' . fileno($err), @command);
    close $stdin;
    chdir $previous_dir or die "chdir $previous_dir: $!";
    waitpid($pid, 0);
    my $status = $?;
    seek $out, 0, 0 or die "seek stdout: $!";
    seek $err, 0, 0 or die "seek stderr: $!";
    local $/;
    return ($status, scalar(<$out>) // '', scalar(<$err>) // '');
}

sub git {
    my ($dir, @args) = @_;
    my ($status, $out, $err) = run_command($dir, 'git', @args);
    die "git @args failed: $err" if $status;
    chomp $out;
    return $out;
}

sub write_file {
    my ($path, $content) = @_;
    open my $fh, '>', $path or die "open $path: $!";
    print {$fh} $content;
    close $fh or die "close $path: $!";
}

sub fixture {
    my (%opts) = @_;
    my $dir = tempdir(CLEANUP => 1);
    my $component = "$dir/test-module";
    my $openresty = "$dir/openresty";
    make_path("$openresty/util");
    git($openresty, 'init', '-q', '-b', 'master');

    if (!$opts{missing_repo}) {
        make_path($component);
        git($component, 'init', '-q', '-b', 'master');
        my $prefix = $opts{plain_tags} ? '' : 'v';
        for my $version ('1.0', '2.0') {
            write_file("$component/content", "$version\n");
            git($component, 'add', 'content');
            git($component, 'commit', '-q', '-m', "feature: version $version.");
            my @args = $opts{annotated_tags} ? ('-a', '-m', "version $version") : ();
            git($component, 'tag', @args, "$prefix$version");
        }
    }

    for my $version ('1.0', '2.0') {
        my $owner = $opts{move_repo} && $version eq '2.0' ? 'new-owner' : 'old-owner';
        my $manifest = "ver=$version\n"
            . '$root/util/get-tarball "https://example.invalid/'
            . "$owner/test-module/archive/v\$ver.tar.gz\" -O test-module-\$ver.tar.gz\n";
        $manifest = '' if $opts{empty_manifest}
            || ($opts{remove_component} && $version eq '2.0');
        write_file("$openresty/util/mirror-tarballs", $manifest);
        git($openresty, 'add', 'util/mirror-tarballs');
        git($openresty, 'commit', '-q', '--allow-empty', '-m', "OpenResty $version.");
        git($openresty, 'tag', "v$version.0.1");
    }

    return $dir;
}

sub run_script {
    my ($dir, @args) = @_;
    return run_command($dir, $^X, $script,
        '-d', "$dir/openresty",
        '--old-tag', '1.0.0.1', '--new-tag', '2.0.0.1', @args);
}

sub fails_with {
    my ($dir, $pattern) = @_;
    my ($status, $out, $err) = run_script($dir);
    isnt($status, 0, 'exits with an error');
    like($err, $pattern, 'reports the cause');
    is($out, '', 'does not emit a partial changelog');
    unlike($err, qr/Use of uninitialized value/, 'does not use an undefined endpoint');
}

subtest 'missing OpenResty repository' => sub {
    my $dir = tempdir(CLEANUP => 1);
    fails_with($dir, qr/Repository directory '\Q$dir\E\/openresty' does not exist/);
};

subtest 'OpenResty directory is not a repository' => sub {
    my $dir = tempdir(CLEANUP => 1);
    make_path("$dir/openresty");
    fails_with($dir, qr/Directory '\Q$dir\E\/openresty' is not a Git repository/);
};

for my $version ('1.0', '2.0') {
    subtest "missing OpenResty $version tag" => sub {
        my $dir = fixture();
        git("$dir/openresty", 'tag', '-d', "v$version.0.1");
        fails_with($dir, qr/Missing tag in repository '\Q$dir\E\/openresty': tried 'v\Q$version\E.0.1' and '\Q$version\E.0.1'/);
    };
}

subtest 'missing component repository is not cloned' => sub {
    my $dir = fixture(missing_repo => 1);
    fails_with($dir, qr/Repository directory '\Q$dir\E\/test-module' does not exist/);
    ok(!-e "$dir/test-module", 'does not create the missing directory');
};

subtest 'component directory must have its own Git repository' => sub {
    my $dir = fixture(missing_repo => 1);
    git($dir, 'init', '-q', '-b', 'master');
    make_path("$dir/test-module");
    fails_with($dir, qr/Directory '\Q$dir\E\/test-module' is not a Git repository/);
};

subtest 'invalid Git metadata cannot fall back to the parent repository' => sub {
    my $dir = fixture(missing_repo => 1);
    git($dir, 'init', '-q', '-b', 'master');
    make_path("$dir/test-module/.git");
    fails_with($dir, qr/Directory '\Q$dir\E\/test-module' is not a Git repository root/);
};

for my $version ('1.0', '2.0') {
    subtest "missing component $version tag" => sub {
        my $dir = fixture();
        git("$dir/test-module", 'tag', '-d', "v$version");
        fails_with($dir, qr/Missing tag in repository '\Q$dir\E\/test-module': tried 'v\Q$version\E' and '\Q$version\E'/);
    };
}

for my $opts ({}, { plain_tags => 1 }, { annotated_tags => 1 }, { move_repo => 1 }) {
    my $name = join(', ', sort keys %$opts) || 'prefixed lightweight tags';
    subtest "successful comparison: $name" => sub {
        my $dir = fixture(%$opts);
        my ($status, $out, $err) = run_script($dir);
        my $prefix = $opts->{plain_tags} ? '' : 'v';
        is($status, 0, 'exits successfully');
        is($out, "* test-module\t: From ${prefix}1.0 to ${prefix}2.0.\n"
            . "    * feature: version 2.0. _Thanks Check Tag Test for the patch._\n",
            'reports the exact tag range with a consistent component heading');
        unlike($err, qr/Use of uninitialized value/, 'does not use an undefined endpoint');
    };
}

subtest 'tag must resolve to a commit' => sub {
    my $dir = fixture();
    my $blob = git("$dir/test-module", 'rev-parse', 'HEAD:content');
    git("$dir/test-module", 'tag', '-f', 'v2.0', $blob);
    fails_with($dir, qr/Failed to run command .*refs\/tags\/v2\.0\^\{commit\}/);
};

subtest 'branch with the same name cannot override a tag' => sub {
    my $dir = fixture();
    git("$dir/test-module", 'branch', 'v2.0', 'refs/tags/v1.0');
    my ($status, $out, $err) = run_script($dir);
    is($status, 0, 'exits successfully');
    is($out, "* test-module\t: From v1.0 to v2.0.\n"
        . "    * feature: version 2.0. _Thanks Check Tag Test for the patch._\n",
        'uses the tag even when the branch points to a different commit');
};

subtest 'unexpected branch does not silently skip the component' => sub {
    my $dir = fixture();
    git("$dir/test-module", 'checkout', '-q', '-b', 'topic');
    fails_with($dir, qr/Repository 'test-module' has unexpected branch or tracked changes/);
};

subtest 'tracked changes do not silently skip the component' => sub {
    my $dir = fixture();
    write_file("$dir/test-module/content", "local changes\n");
    fails_with($dir, qr/Repository 'test-module' has unexpected branch or tracked changes/);
};

subtest 'removed component cannot produce an empty comparison endpoint' => sub {
    my $dir = fixture(remove_component => 1);
    fails_with($dir, qr/Missing component 'test-module' in OpenResty '2.0.0.1'/);
};

subtest 'empty component lists succeed' => sub {
    my $dir = fixture(empty_manifest => 1);
    my ($status, $out, $err) = run_script($dir);
    is($status, 0, 'exits successfully');
    is($out, '', 'there are no component changes');
    unlike($err, qr/Use of uninitialized value/, 'does not use an undefined map');
};

subtest 'HEAD comparison still works' => sub {
    my $dir = fixture();
    my ($status, $out, $err) = run_script($dir, '--new-tag', 'HEAD');
    is($status, 0, 'exits successfully');
    is($out, "* test-module\t: From v1.0 to v2.0.\n"
        . "    * feature: version 2.0. _Thanks Check Tag Test for the patch._\n",
        'compares the old tag with the latest component tag');
};

subtest 'HEAD comparison excludes commits after the latest tag' => sub {
    my $dir = fixture();
    write_file("$dir/test-module/content", "untagged changes\n");
    git("$dir/test-module", 'add', 'content');
    git("$dir/test-module", 'commit', '-q', '-m', 'feature: untagged changes.');
    my ($status, $out, $err) = run_script($dir, '--new-tag', 'HEAD');
    is($status, 0, 'exits successfully');
    is($out, "* test-module\t: From v1.0 to v2.0.\n"
        . "    * feature: version 2.0. _Thanks Check Tag Test for the patch._\n",
        'the heading and commits stop at the latest tag');
};

subtest 'unchanged tag produces no changelog even with later HEAD commits' => sub {
    my $dir = fixture();
    my ($status, $out, $err) = run_script($dir,
        '--old-tag', '2.0.0.1', '--new-tag', 'HEAD');
    is($status, 0, 'unchanged component succeeds');
    is($out, '', 'unchanged component has no changelog');

    write_file("$dir/test-module/content", "untagged fix\n");
    git("$dir/test-module", 'add', 'content');
    git("$dir/test-module", 'commit', '-q', '-m', 'bugfix: untagged fix.');
    ($status, $out, $err) = run_script($dir,
        '--old-tag', '2.0.0.1', '--new-tag', 'HEAD');
    is($status, 0, 'untagged component changes succeed');
    is($out, '', 'untagged commits are excluded from the release changelog');
};

subtest 'fixed release comparison excludes later HEAD commits' => sub {
    my $dir = fixture();
    write_file("$dir/test-module/content", "later changes\n");
    git("$dir/test-module", 'add', 'content');
    git("$dir/test-module", 'commit', '-q', '-m', 'feature: later changes.');
    my ($status, $out, $err) = run_script($dir);
    is($status, 0, 'exits successfully');
    is($out, "* test-module\t: From v1.0 to v2.0.\n"
        . "    * feature: version 2.0. _Thanks Check Tag Test for the patch._\n",
        'the heading and commits stop at the selected release tag');
};

subtest 'defaults resolve from util regardless of the working directory' => sub {
    my $dir = fixture();
    my $installed = "$dir/openresty/util/gen-release-log.pl";
    copy($script, $installed) or die "copy $script: $!";
    my $unrelated = tempdir(CLEANUP => 1);
    make_path("$unrelated/test-module");

    for my $cwd ("$dir/openresty", $dir, $unrelated) {
        my ($status, $out, $err) = run_command($cwd, $^X, $installed,
            '--old-tag', '1.0.0.1', '--new-tag', '2.0.0.1');
        is($status, 0, "runs from $cwd");
        is($out, "* test-module\t: From v1.0 to v2.0.\n"
            . "    * feature: version 2.0. _Thanks Check Tag Test for the patch._\n",
            'finds the OpenResty repository and its sibling component');
    }
};

subtest 'relative -d resolves siblings from the selected OpenResty repository' => sub {
    my $dir = fixture();
    my ($status, $out, $err) = run_command("$dir/openresty/util", $^X, $script,
        '-d', '..', '--old-tag', '1.0.0.1', '--new-tag', '2.0.0.1');
    is($status, 0, 'relative repository override succeeds');
    is($out, "* test-module\t: From v1.0 to v2.0.\n"
        . "    * feature: version 2.0. _Thanks Check Tag Test for the patch._\n",
        'finds components relative to the selected repository');
};

subtest 'repository paths containing spaces and shell characters are literal' => sub {
    my $dir = fixture();
    my $renamed = "$dir repositories \$(false) ' literal";
    rename $dir, $renamed or die "rename $dir: $!";
    my ($status, $out, $err) = run_script($renamed);
    rename $renamed, $dir or die "rename $renamed: $!";
    is($status, 0, 'paths are passed directly to Git');
    is($out, "* test-module\t: From v1.0 to v2.0.\n"
        . "    * feature: version 2.0. _Thanks Check Tag Test for the patch._\n",
        'shell characters do not change repository lookup');
};

done_testing();
