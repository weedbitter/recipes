#!/bin/bash

. pgrp.sh

#
# 工作函数
# Usage: 子定义
# 建议调用方式:  hary name p1 p2 p3 .. pN
#
hary(){
    name=$1;
    cnt=$2;
    i=0;
    while [ $i -le 3 ]; do
        echo "hary-thread[$name][$i] is running";
        sleep 1;
        ((i=i+1));
    done
}                                                                                                                     
# 主函数
if check_cmd hary; then
    rtn=$?

    # 初始化线程池 
    pg_init 4

    # 启动线程
    for i in `seq 10`
    do
        thread hary "t-$i" $i   # hary为调用的子进程函数，可以在后边加参数: name p1 ... pN
    done

    # 等待子进程都执行完毕后退出                                                            
    pg_wait && exit $? 
else
    exit $rtn
fi                                        

