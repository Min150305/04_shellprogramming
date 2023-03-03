#!/bin/bash

echo -n "Choice yes or no (yes/no)" 
read CHOICE

#echo $CHOICE

case $CHOICE  in 
    yes|Y|YES|y)  echo " OK " ;;
    NO|N|no|n)    echo " NO " ;;
    *) echo " yes or no " 
       exit 4 ;;
esac