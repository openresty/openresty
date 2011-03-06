use strict;
use warnings;

use Test::More tests => 1;
use Text::Diff;

sub shell (@);
sub cd ($);

my $ver = `bash util/ver`;
chomp $ver;

#shell "make";

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

is_diff($got, $expected, "--help ok");

sub shell (@) {
    print "@_\n";
    system(@_) == 0 or die "failed to run command @_\n";
}

sub cd ($) {
    my $dir = shift;
    print("cd $dir\n");
    chdir $dir or die "failed to cd $dir: $!\n";
}

sub is_diff {
    my ($actual, $expected, $name) = @_;

    if (!defined $name) {
        $name = '';
    }

    ok $actual eq $expected,
       $name . "\n" . Text::Diff::diff(\$expected, \$actual);
}

