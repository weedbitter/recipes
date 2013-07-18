#!/usr/bin/perl

use strict;
use warnings;

#######################################################################
# #检测变量 
unless ($#ARGV ){ 
    print "useage:perl parse_excel_muban0500.pl [excel_name] [out_filename]\n";
    exit(1); 
} 
my $file_name = $ARGV[0]; 

my $col = 0;
my $zifu = 0;
my $wds = 0;

open(FILE,"$file_name") or die "Can't Open $file_name .\n";
while(<FILE>){
    my @file=$_;  #将文件读入数组
    $col ++;
}
chomp @file;  #去掉回车
close (FILE);   # 关闭文件

foreach $_ (@file) # 将文件file中每一行数据赋值给$_，$_为模式比配默认目的串
{
    while(/([/w]+-?[/w]*)[/s| , | . | ! ]/g)   #[/w/+ 为一个字符[A-Za-z0-9]出现一次或多次，[-]?为连字符
    {   
         $Word{$1}++;  #hash索引,$1作为索引值,单词个数作为关联值.
    }
}
foreach $hash (keys %Word)
{
    print "$hash occures $Word{$hash} times/n";
}




}

while(<FILE>){
    s/^\s+//g;
    s/\s+$//g;
    next if /^$/;
    my @words = split; 

}

