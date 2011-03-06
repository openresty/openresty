use strict;
use warnings;

use Test::More tests => 1;
use Test::Differences;

sub shell (@);
sub cd ($);

my $ver = `bash util/ver`;
chomp $ver;

shell "make";

cd "ngx_openresty-$ver";
shell "./configure --help > help.txt";

open my $in, "help.txt" or
    die "Cannot open help.txt for reading: $!\n";
my $got = do { local $/; <$in> };
close $in;

open $in, "../t/help.txt" or
    die "Cannot open ../t/help.txt for reading: $!\n";
my $expected = do { local $/; <$in> };
close $in;

eq_or_diff $got, $expected, "--help ok";

sub shell (@) {
    print "@_\n";
    system(@_) == 0 or die "failed to run command @_\n";
}

sub cd ($) {
    my $dir = shift;
    print("cd $dir\n");
    chdir $dir or die "failed to cd $dir: $!\n";
}

