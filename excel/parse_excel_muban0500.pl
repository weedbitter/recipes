#!/usr/bin/perl
use strict; 
use Spreadsheet::ParseExcel; 


#######################################################################
# # Variable Section 
if ($#ARGV < 1){ 
  	print "useage:perl parse_excel_muban0500.pl [excel_name] [out_filename]\n";
    exit(1); 
} 
my $excle_name = $ARGV[0]; 
my $data_file= $ARGV[1];
	  
#****************************************************** #* 
#trim函数,过滤字符串中的非法字符 
#****************************************************** 
sub trim {  
	my ($string)= $_[0];  
	#去除字符前面的空白  
	$string =~ s/^\s+//g;  
	#去除字符后面的空白  
	$string =~ s/\s+$//g;  
	$string =~ s/\s+//g;   
	return $string; 
} 
#****************************************************** 
#* 解析excel 
#****************************************************** 
sub parseExcel{  
	my $parser = Spreadsheet::ParseExcel->new();   
	my $workbook = $parser->parse($excle_name);
	
	if ( !defined $workbook ) {       
		die $parser->error()."\n";   
	} 
	my $worksheet;   
	my $tempstr;
	    
	unless( open( FILEHANDLE, ">$data_file" ) ) { 
		print "Error: 打开文件 '$data_file' 失败！\n";    
		exit(1)    
	} 
	foreach $worksheet ( $workbook->worksheets() ) { 
		my ( $row_min, $row_max ) = $worksheet->row_range();     
		my ( $col_min, $col_max ) = $worksheet->col_range();     
		foreach my $row ( $row_min .. $row_max ) {       
			foreach my $col ( $col_min .. $col_max ) { 
				my $cell = $worksheet->get_cell( $row, $col );         
				if (defined($cell)) {          
					$tempstr=$cell->value();          
					$tempstr=trim($tempstr);          
					if($col<$col_max){           
						printf FILEHANDLE ($tempstr."\t");          
					}else{           
						printf FILEHANDLE ($tempstr);          
					}         
				}else{          
					if($col<$col_max){           
						printf FILEHANDLE ("\t");          
					}else{           
						printf FILEHANDLE ("");          
					}         
				}            
			} 
			printf FILEHANDLE ("\n");     
		} 
    	close (FILEHANDLE); 
    	print "file ${data_file} create success!\n";   
	} 
	return 0; 
} 
###################################################################### 
# Main Function 
sub main {   
  parseExcel(); 
}  
###################################################################### 
# Program Section  
open(STDERR, ">&STDOUT");  
exit(main()); 
