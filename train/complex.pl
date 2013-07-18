use strict;
use warnings;

# .pm
# 
# our  包变量
# JSON 
# XML
# array + hash
#
# lexical   stack variable
# global
#

$href = 
{

   k1 => [1, 2, 3 ],
   k2 => {
      k21 => [210, 211, 212],
      k22 => 22,
   },
};

warn $href->{k2}{k21}[1];
# warn $href{k2}{k21}[1];
