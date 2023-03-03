#!/bin/bash

tmp1=/test/tmp1
tmp2=/test/tmp2


echo "pv list"

fdisk -l | grep LVM | awk '{print $1}' > $tmp1
pvs | tail -n +2 | cut -c3- | awk '{print $1}' > $tmp2

cat $tmp1 $tmp2 | sort | uniq -u


#echo -n "PV NAME : "
#read PVNAME

echo -n "PV device : "
read PVDEVICE

pvcreate $PVNAME $PVDEVICE

if [ $? -eq 0 ] ; then
    echo "[OK]"
else
    echo "[FAIL]"
fi