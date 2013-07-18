#!/bin/bash

function f1 {
  echo "$$";
  echo "$@";
    echo "$*";
	  echo "$1, $2";
	    return 2;   # 进程组退出状态
	}

	result=$(f1 a b c d);
	echo "status = $?"
	echo "result = [$result]";
