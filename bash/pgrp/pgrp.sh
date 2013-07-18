#!/bin/bash  

############################################################
# bash线程池
############################################################
# 环境变量:
#     PGRP_DEBUG :  直接运行测试
############################################################
#
# API:
#     1. pg_init : 初始化线程池， 设置线程大小
#                : pg_init 4
#
#     2. thread  : 启动线程  
#                : thread $sub $name $p1 ... $pN
#                : $sub        - 需要开发的线程函数
#                : $p1 ... $pN - 传递线程函数$sub的参数
#
#     3. pg_wait : 等待所有线程结束
#                : pg_wait
############################################################
# 初始化线程
# Usage : pg_init 10
#         - 启动一个大小为10的线程池
############################################################
pg_init(){  

    # 创建fifo管道
    tmp_fifofile="/tmp/$$.fifo" 
    mkfifo $tmp_fifofile  
    exec 6<>$tmp_fifofile  
    rm $tmp_fifofile  

    # 设置线程池大小
    [ $# -ne 0 ] && thread=$@ || thread=5 

    # 发送几个空行到管道, 这个空行相当于一张票(ticket),
    # 谁拿到一张票, 就可以启动进程, 
    # 哪个进程退出, 需要将票放回管道
    for ((i=0;i<$thread;i++))  
    do  
        echo  
    done >&6 
}  

# 
# 检查函数是否存在
# Usage: check_cmd "pg_init 15" 
# if pg_init function is exist, return 0 ,else return 1.  
#
check_cmd(){  
    if [ $# -ne 0 ]; then  
        type "$1" &> /dev/null  
        rtn=$?  
        [ $rtn -eq 0 ] && return 0 || return $rtn  
    else 
        return 1 
    fi  
}  

#
# 线程主函数
# Usage: thread worker name
#     worker  - 线程函数
#     name - 线程名称
#
thread(){ 
   
    # 从6号文件描述符上读(取票), 阻塞住了, 
    # 如果读到(拿到票), 就可以开始执行任务(后台运行)
    read -u6
    {
        # $@ 是线程参数: worker name p1 ... pN
        "$@" && {                                                                                             
            echo "thread $2 is finished[$@]"                                                          
        } || {                                                                                        
            echo "thread $2 error!!! "                                                            
        }
        # 完成工作后, 发送空行到6号文件描述符, 把票交回
        echo >&6                                                                                              
    } &   # 后台运行任务

    # 上个后台进程的ID
    pid=$!
    echo "thread[$2] is started [$pid][$@]"
}

#
# 等待线程结束
# Usage: pg_wait
#
pg_wait(){ 
    wait        # wait要等所有的子进程退出才完全返回 
    exec 6>&-;  # 所有子进程退出后, 关闭6号文件描述符 
    return 0
}

#
# 工作函数
# Usage: 子定义
# 建议调用方式:  worker name p1 p2 p3 .. pN
#
worker(){
    name=$1;
    cnt=$2;
    i=0;
    while [ $i -le 3 ]; do
        echo "thread[$name][$i] is running";
        sleep 1;
        ((i=i+1));
    done
}                                                                                                                  

#
# PGRP_DEBUG情况下, 测试运行pgrp.sh
#
if [[ -n ${PGRP_DEBUG} ]]; then
    # Main
    if check_cmd worker; then
        rtn=$?
    
        #--------------DIY BEGIN----------------
        # 初始化线程池 
        pg_init 4
    
        # 启动线程
        for i in `seq 100`
        do
            # worker为调用的子进程函数，可以在后边加参数 
            thread worker "t-$i" $i 
        done
    
        # 等待子进程都执行完毕后退出                                                            
        pg_wait && exit $? 
        #-------------DIY END ------------------
    else
        exit $rtn
    fi                                        
fi

