#!/bin/bash

CONFIG="using codeset utf-8 territory cn collate using system";
db2 "create database zdb automatic storage yes on /db2auto $CONFIG";
db2 update db cfg for zdb using newlogpath /db2plog  # 日志目录
db2 update db cfg for zdb using logfilsiz 25600;     # 25600/1024 = 
db2 update db cfg for zdb using logprimary 20;       
db2 update db cfg for zdb using logsecond 10;


