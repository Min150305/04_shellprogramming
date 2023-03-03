#!/bin/bash

echo -n "Enter A : "
read NUM1

echo -n "Enter Operator (+|-|/|*): "
read OP 

echo -n "Enter B : "
read NUM2

case $OP in
    +) echo " $NUM1 + $NUM2 = $( expr $NUM1 + $NUM2 )" ;;
    -) ;;
    /) ;;
    \*) echo " $NUM1 * $NUM2 = $( expr $NUM1 \* $NUM2)" ;;
    *)  echo " fail" ;;
esac