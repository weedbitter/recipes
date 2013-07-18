#!/bin/bash
data="name,sex,rollno,location";
oldIFS=$IFS
IFS=,
for item in $data; do
    echo $item;
done
IFS=$oldIFS  # 重置回来IFS
