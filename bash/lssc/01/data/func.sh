#!/bin/bash

function f1 {
   echo "$@";
   echo "$*";
   echo "$1, $2";
   return 2;
}

result=$(f1 a b c);
echo "status = $?";
echo "result = [$result]";

