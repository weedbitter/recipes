#!/usr/bin/perl
use Zeta::POE::HTTPD;
use POE;

warn "listen on $ARGV[0]:$ARGV[1]";
Zeta::POE::HTTPD->spawn( 
   ip       => $ARGV[0],
   port     => $ARGV[1], 
   callback => sub { 'hello world'; },
);
$poe_kernel->run();
exit 0;

