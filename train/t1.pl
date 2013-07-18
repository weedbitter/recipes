#!/usr/bin/perl

use IO::File;
#
#
# ''
# ""   interpolation
# 0   STDIN    r
# 1   STDOUT   w
# 2   STDERR   w
#

my $fh = IO::File->new(">test.dat");


open STDERR, ">&", $fh;
print STDERR "hello world\n", "ni guan yun\n";

exit 0;

print "hello world\n", "ni guan yun\n";

print "enter you input: ";
$a = <>;

warn "you entering is $a";



