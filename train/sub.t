
sub sum {
   my $sum;
   for (@_) {
       $sum += $_;
   }
   return $sum;
}

$s1  = sum 1, 2, 3;
$s2  = sum(1, 2, 3, 4);

warn "$s1, $s2";
