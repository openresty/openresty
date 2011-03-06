package t::Config;

use Test::Base -Base;
use IPC::Run3 qw( run3 );

our @EXPORT = qw(
    run_tests
);

sub run_tests;
sub run_test ($);
sub shell (@);
sub cd ($);

our $BuildRoot;

sub run_tests {
    my $ver = `bash util/ver`;
    chomp $ver;

    cd "ngx_openresty-$ver";

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
    }

    my $expected_out = $block->out;
    if (!defined $expected_out) {
        $expected_out = '';
    } else {
        $expected_out =~ s/\$OPENRESTY_BUILD_DIR\b/$BuildRoot/gs;
    }

    is($stdout, $expected_out, "$name - stdout ok");
    is($stderr, $expected_err, "$name - stderr ok");
    is($retval >> 8, $expected_exit, "$name - exit code ok");
}

sub shell (@) {
    system(@_);
}

sub cd ($) {
    my $dir = shift;
    print("cd $dir\n");
    chdir $dir or die "failed to cd $dir: $!\n";
}

