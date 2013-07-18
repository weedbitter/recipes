#!/usr/bin/perl
use Data::Dump;

my %res;
while(<DATA>) {

   # 
   s/^\s+//g;
   s/\s+$//g;
   next if /^$/;

   my ($a, @data) = split;
   $res{$a} = &sum(@data); 
}

sub sum {
   my $sum;
   for (@_) {
       $sum += $_;
   }
   return $sum;
}

Data::Dump->dump(\%res);

#
#  a => 6
#  b => 10
#  c => 15
#

__END__
a 1 2 3

b 1 2 3 4

c 1 2 3 4 5

