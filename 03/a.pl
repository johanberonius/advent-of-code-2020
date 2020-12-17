#!/usr/bin/perl
use strict;
use Term::ANSIColor;

my ($x, $y) = (0, 0);
my ($w, $h);
my %g;
while (<>) {
    chomp;
    $g{$x++ .','. $y} = $_ for split '';
    $y++;
    $w = $x;
    $h = $y;
    $x = 0;
}

print "Width: $w\n";
print "Height: $h\n";
print "Size: ", $w * $h, "\n";

my ($x, $y) = (0, 0);
my ($dx, $dy) = (3, 1);
my %m;
my $t = 0;
my $xmax = 0;
while ($y < $h) {
    my $lx = $x % $w;
    $t++ if $g{"$lx,$y"} eq '#';
    $m{"$x,$y"} = $g{"$lx,$y"} eq '#' ? 'X' : 'O';
    $x += $dx;
    $y += $dy;
    $xmax = $x if $x > $xmax;
}

print "Max X: $xmax\n";
print "Encountered $t trees.\n";

# exit;

for my $y (0 .. $h) {
    for my $x (0 .. $xmax) {
        my $lx = $x % $w;
        my $g = $g{"$lx,$y"};
        my $m = $m{"$x,$y"};
        if ($m eq 'X') {
            print color('on_rgb420'), ' X '
        } elsif ($m eq 'O') {
            print color('on_rgb115'), ' O '
        } elsif ($g eq '#') {
            print color('on_rgb310'), ' # '
        } elsif ($g eq '.') {
            print color('on_blue'), ' • ';
        } else {
            print color('reset'), '   ';
        }
    }
    print color('reset'), "\n";
}

