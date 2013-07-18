#!/bin/bash

cat read_while.dat |
while read v; do
    echo "got line[$v]";
done

