#!/usr/bin/perl
use strict;

for my $sn (
    [0,3,6],
    [1,3,2],
    [2,1,3],
    [1,2,3],
    [2,3,1],
    [3,2,1],
    [3,1,2],
    [18,8,0,5,4,1,20],
    ) {
    my %t;
    my $n;
    my $p;
    my $a;
    my $t = 0;

    while ($t < @$sn) {
        $t++;
        $n = $sn->[$t-1];

        $a = $t{$n} ? $t - $t{$n} : 0;
        $t{$n} = $t;
        $p = $n;
    }

    while ($t < 30_000_000) {
        $t++;
        $n = $a;

        $a = $t{$n} ? $t - $t{$n} : 0;
        $t{$n} = $t;
        $p = $n;
    }

    print "Starting numbers @$sn, turn $t number $n\n";
}
