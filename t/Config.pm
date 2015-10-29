package t::Config;

use Test::Base -Base;
use IPC::Run3 qw( run3 );
use Cwd qw( cwd );

our @EXPORT = qw(
    run_tests
);

sub run_tests;
sub run_test ($);
sub shell (@);
sub cd ($);

our $BuildRoot;
our $DistRoot;
our @SavedTests;
our $RootDir = `pwd`;
chomp $RootDir;

sub run_tests {
    my $ver = `bash util/ver`;
    chomp $ver;

    cd "ngx_openresty-$ver";

    $DistRoot = cwd();
    $BuildRoot = File::Spec->rel2abs("./build");

    for my $block (blocks()) {
        run_test($block);
    }
}

sub run_test ($) {
    my $block = shift;

    my $name = $block->name;
    my $cmd = $block->cmd or
        die "No --- cmd defined for $name\n";

    #warn "$cmd > out.txt 2>\&1";
    my ($stdout, $stderr);
    run3 $cmd, undef, \$stdout, \$stderr;
    my $retval = $?;

    my $expected_exit = $block->exit;
    if (!defined $expected_exit) {
        $expected_exit = 0;
    }

    my $expected_err = $block->err;
    if (!defined $expected_err) {
        $expected_err = '';
    } else {
        $expected_err =~ s/\$OPENRESTY_BUILD_DIR\b/$BuildRoot/gs;
        $expected_err =~ s/\$OPENRESTY_DIR\b/$DistRoot/gs;
    }

    my $expected_out = $block->out;
    if (!defined $expected_out) {
        $expected_out = '';
    } else {
        #$expected_out =~ s/\$OPENRESTY_BUILD_DIR\b/$BuildRoot/gs;
    }

    #die $BuildRoot;

    $stdout =~ s/\Q$BuildRoot\E/\$OPENRESTY_BUILD_DIR/g;
    $stdout =~ s/\Q$DistRoot\E/\$OPENRESTY_DIR/g;

    is($stdout, $expected_out, "$name - stdout ok");
    is($stderr, $expected_err, "$name - stderr ok");
    is($retval >> 8, $expected_exit, "$name - exit code ok");

    my $makefile;

    if (defined $block->makefile) {
        open my $in, "Makefile" or
            die "cannot open Makefile for reading: $!";
        $makefile = do { local $/; <$in> };
        close $in;

        my $expected_makefile = $block->makefile;
        #$expected_makefile =~ s/\$OPENRESTY_BUILD_DIR\b/$BuildRoot/gs;

        $makefile =~ s/\Q$BuildRoot\E/\$OPENRESTY_BUILD_DIR/g;
        $makefile =~ s/\Q$DistRoot\E/\$OPENRESTY_DIR/g;

        is($makefile, $expected_makefile, "$name - Makefile ok");
    }

    push @SavedTests, {
        cmd => $cmd,
        name => $name,
        exit => $retval >> 8,
        err => $stderr,
        out => $stdout,
        makefile => $makefile,
    };
}

END {
    if ($0 =~ /_$/) {
        return;
    }

    chdir "$RootDir";
    #warn `pwd`;

    my $outfile = $0 . '_';
    if (-f $outfile) {
        unlink $outfile;
    }

    open my $in, $0 or
        die "cannot open $0 for reading: $!\n";

    while (<$in>) {
        if (/^--- (?:ONLY|LAST)$/) {
            return;
        }
    }

    close $in;

    open my $out, ">$outfile" or
        die "cannot open $outfile for writing: $!\n";

    open $in, $0 or
        die "cannot open $0 for reading: $!\n";
    while (<$in>) {
        print $out $_;
        if (/^__DATA__$/) {
            last;
        }
    }
    close $in;

    print $out "\n";

    my $n = @SavedTests;

    my $i = 0;
    for my $block (@SavedTests) {
        my $name = $block->{name};
        my $cmd = $block->{cmd};
        my $stdout = $block->{out};
        my $makefile = $block->{makefile};
        my $exit = $block->{exit};
        my $err = $block->{err};

        #$stdout =~ s/$BuildRoot/\$OPENRESTY_BUILD_DIR/g;

        print $out <<"_EOC_";
=== $name
--- cmd: $cmd
--- out
$stdout
_EOC_

        if ($makefile) {
            #$makefile =~ s/$BuildRoot\b/\$OPENRESTY_BUILD_DIR/g;
            print $out "--- makefile\n$makefile";
        }

        if ($err) {
            print $out "--- err\n$err";
        }

        if ($exit) {
            print $out "--- exit: $exit\n";
        }

        if ($i++ < $n - 1) {
            print $out "\n\n\n";
        }
    }

    print $out "\n";

    close $out;

    warn "wrote $outfile\n";
}

sub shell (@) {
    system(@_);
}

sub cd ($) {
    my $dir = shift;
    print("cd $dir\n");
    chdir $dir or die "failed to cd $dir: $!\n";
}

