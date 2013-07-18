#!/bin/bash

# 数字比较
if [ 10 -gt 5 -a 90 -lt 100 ]; then
    echo "10 > 5 并且 90 < 100";
fi

# 字符串比较
if [[ "aby" > "abx" ]] && [[ "aby" < "abz" ]]; then
    echo "abx  < aby < abz";
fi

# 文件测试
if [ -e "./cmp.sh" -a -x "./cmp.sh" ]; then
    echo "cmp.sh存在且可执行";
fi
