#!/bin/bash

# 方式1
:<<comment
ls -l;
date;
while true; do
    echo "while 1";
done
comment

echo "---------------test";

