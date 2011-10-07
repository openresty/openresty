#!/usr/bin/env perl

use strict;
use warnings;

my $ver = shift or usage();
my $newver = shift or usage();

my @files = `find patches -name '*.patch'`;
for my $file (@files) {
    chomp $file;
    next unless $file =~ m{^patches/nginx-(?:$ver|$newver)-};
    (my $newfile = $file) =~ s/nginx-$ver-/nginx-$newver-/g;
    if ($newfile ne $file && !-f $newfile) {
        my $cmd = "cp $file $newfile";
        system($cmd) == 0
            or die "failed run command $cmd.\n";

        $cmd = "git add $newfile";
        system($cmd) == 0
            or die "failed run command $cmd.\n";
    }

    my $cmd = "sed -i 's/\Q$ver\E/$newver/g' $newfile";
    system($cmd) == 0
            or die "failed to run command $cmd.\n";

    my $oldver_int = version_to_int($ver);
    my $newver_int = version_to_int($newver);

    warn "$oldver_int => $newver_int\n";

    $cmd = "sed -i 's/$oldver_int/$newver_int/g' $newfile";
    system($cmd) == 0
            or die "failed to run command $cmd.\n";

    print "$file => $newfile\n";
}

sub usage {
    die "Usage: $0 <old-version> <new-version>\n";
}

sub version_to_int {
    my $ver = shift;
    $ver =~ s/\.(\d+)/sprintf("%03d", $1)/eg;
    $ver
}

