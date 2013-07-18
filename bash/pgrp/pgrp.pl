#!/usr/bin/perl

my $cnt = $ARGV[0];

while(1) {
    warn "cnt = $cnt\n";
    sleep 1;
    exit 0 unless --$cnt;
}

