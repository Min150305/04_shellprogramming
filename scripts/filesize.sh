#!/bin/bash


if [ $# -ne 1 ] ; then
   echo "Usage $0 <filename>"
   exit 2
fi 

file1="$1"
filesize=$(wc -c < $file1)
#echo $filesize

if [ $filesize -ge 5120 ] ; then
   echo " Big ($filesize) bytes"
else
   echo " Small ($filesize) bytes"
fi




: <<EOF
echo "NAME : "
read FILE

if [ $File gt 5 ] ; then
    echo :
else 
    :
fi 
EOF