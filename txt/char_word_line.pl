#!/usr/bin/perl

my $line;
my $word;
my $char;
while(<DATA>) {
   $line++;
   my @word = split /[,; ]+/, $_;
   $word += @word;
   $char += length $_;
}

warn "line : $line\n";
warn "word : $word\n";
warn "char : $char\n";

__END__
abc def
abc
kkk
