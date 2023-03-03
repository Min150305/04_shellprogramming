#!/bin/bash


# if [ $# -ne 1 ] ; then
#     echo "Retry"
# fi



A1=$(cat report.txt | awk '{print $1}'| head -n 1)
echo $A1

B1=$(cat report.txt | awk '{print $1}'| head -n 7 | tail -n 1)
echo $B1

C1=$(cat report.txt | awk '{print $1}'| head -n 12 | tail -n 1)
echo $C1

FILE=/root/bin/report.txt
echo $FILE

sed -n "/$A1/,/$B1/p" /root/bin/report.txt