my %fruit_color = (
                   apple  => "red",
                   banana => "yellow",
               );

#
# bareword  
#

my @fruit_color = (
                   "apple"  , "red",
                   "banana" , "yellow",
               );

my @keys = keys %fruit_color;

warn "-------------\n";

@keys = keys @fruit_color;
warn "@keys";
