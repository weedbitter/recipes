shell EOF

Shell中通常将EOF与 << 结合使用，表示后续的输入作为子命令或子Shell的输入，直到遇到EOF为止，再返回到主调Shell。如下：

export NLS_LANG='SIMPLIFIED CHINESE_CHINA.ZHS16GBK'
sqlplus $USERID @$OUT_FILE << EOF
exit
EOF

当把这段代码放在Shell中时，会在Shell脚本执行完毕后自动退出SQLPLUS的命令提示符状态。
<<EOF
（内容）
EOF

可以把EOF替换成其他东西
意思是把内容当作标准输入传给程序这里再简要回顾一下< <的用法。当s h e l l看到< <的时候，它就会知道下一个词是一个分界
符。在该分界符以后的内容都被当作输入，直到s h e l l又看到该分界符(位于单独的一行)。这个
分界符可以是你所定义的任何字符串。

方法1.需要，自动登录mysql（root:root,passwd:123456),查询test库，test1表里的user=aa的记录.

#!/bin/sh
mysql -uroot -p123456 <<EOF
use test;
select * from testaa while a=10000; ###1000 not usr single quote mark,because a is int
                                                  # type,only char type need single quote mark.

exit
EOF
方法2：用expect脚本

3

1 #!/bin/bash
2 #batch_connect.sh
3
4 #cat /dev/null > batch_file
5 echo "use oss_platform;" > batch_file
6
7 URL_list=`cat url_for_db_final`
8 for URL in $URL_list
9 do
10 echo "update pornURL set count=count+1 where url=\"$URL\";" >> batch_file
11 echo "insert into pornURL (url,count) select \"$URL\",1 from dual where not exists (select * from pornURL where
url=\"$URL\");" >> batch_file
12
13 done
14 echo "exit" >> batch_file
15
16
17 cat /dev/null > url_for_db_final

18 mysql -h localhost -u ******* -p*************< batch_file | more
19
20
21 cat /dev/null > batch_file
