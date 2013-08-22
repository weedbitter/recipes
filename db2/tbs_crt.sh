#!/bin/bash

# 连接数据库
db2 connect to zdb;

#
# 建立bufferpool
#  640M = 32K * 20480
#  2G   = 32K * 65536
#  4G   = 32K * 131072
#
db2 "create bufferpool bp32k size 20480 pagesize 32k";

DMS="managed by database";               # 数据库管理表空间
STMP_TBSP="temporary tablespace";        # 系统临时表空间
UTMP_TBSP="user temporary tablespace";   # 用户临时表空间
LARG_TBSP="large tablespace";            # 大表空间
NFSC="no file system caching";           # 无文件系统caching
PS="pagesize 32k"                        # 表空间大小

#
#  1> 数据表空间 tbs_dat
#  2> 索引表空间 tbs_idx
#  3> 临时表空间 tbs_tmp
#  4> 用户来临时 tbs_utmp
#
db2 "create $LARG_TBSP tbs_dat  $PS $DMS using(FILE '/db2tbsp/dat'   5120M) bufferpool bp32k $NFSC";
db2 "create $LARG_TBSP tbs_idx  $PS $DMS using(FILE '/db2tbsp/idx'   2048M)  bufferpool bp32k $NFSC";
db2 "create $STMP_TBSP tbs_tmp  $PS $DMS using(FILE '/db2tbsp/tmp'   2048M)  bufferpool bp32k $NFSC";
db2 "create $UTMP_TBSP tbs_utmp $PS $DMS using(FILE '/db2tbsp/utmp'  2048M)  bufferpool bp32k $NFSC";

