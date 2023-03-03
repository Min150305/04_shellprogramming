#!/bin/bash

echo -n "Enter : "
read FILE

if [  -d $FILE ] ; then
   echo " This is directory "
elif [ -f $FILE ] ; then
   echo " This is File "
else 
   echo " What is this?"
fi 
