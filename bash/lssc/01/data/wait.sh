#!/bin/bash

#
# worker name cnt
#
worker () {
    i=0;
    while [ $i -lt $2 ]; do
        ((i=i+1));
        sleep 1;
    done
    echo "[$@] completed";
}


worker 'A' 1 &
worker 'B' 2 &
worker 'C' 3 &
worker 'D' 4 &

wait

echo "all completed";

