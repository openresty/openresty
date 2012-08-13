#!/usr/bin/env perl

use strict;
use warnings;

sub usage {
    die "Usage: $0 <ver1> <ver2>\n";
}

my $a = shift or usage();
my $b = shift or usage();

my @as = split /\./, $a;
my @bs = split /\./, $b;

my $n = @as > @bs ? scalar(@as) : scalar(@bs);

for (my $i = 0; $i < $n; $i++) {
    my $x = $as[$i];
    my $y = $bs[$i];

    if (!defined $x) {
        $x = 0;
    }

    if (!defined $y) {
        $y = 0;
    }

    if ($x > $y) {
        print "Y\n";
        exit;

    } elsif ($x < $y) {
        print "N\n";
        exit;
    }
}

print "Y\n";

