use Data::Dump;

@arr = (1, 2, 3);
%hash = ( 
    k1 => 1, 
    k2 => 2
);
$s = 100000;

my $aref = \@arr;  
Data::Dump->dump($aref);

$aref = [1, 2, 3];   # anonymous array reference
Data::Dump->dump($aref);

warn $aref->[0];   # syntax sugar
warn $aref->[1];   # visually clean
warn $$aref[1];    # 语法

my @slice = @$aref[1,2];
warn "aref slice is @slice";

warn "-----------------\n";

my $href = \%hash;
Data::Dump->dump($href);
warn $href->{k1};
warn $href->{k2};

@hslice = @$href{'k1', 'k2'};
warn "href slice is @hslice";

my $sref = \$s;
warn $$sref;

__END__

slice


my $cref = sub { };

