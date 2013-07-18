#!/bin/bash


# 打开文件, 向文件写与读
exec 3>/tmp/k1
exec 4</tmp/k1

# 通过3写到/tmp/k1
cat <<EOF 1>&3
a
b
c
EOF

# 通过4读取/tmp/k1
cat <&4

