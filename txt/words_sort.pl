#!/usr/bin/perl
use Data::Dump;

my %stat;
while(<DATA>) {

   s/^\s+//g;
   s/\s+$//g;
   next if /^$/;

   my @word = split /[,;. ]+/, $_;
   for (@word) {
      $stat{$_}++;
   }
}
Data::Dump->dump(\%stat);

## report
for my $word (keys %stat) {
    warn "$word  =>  $stat{$word}\n";
}

__END__
abc abc
def def  def
ghi ghi ghi kkk kkk
