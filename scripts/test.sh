#!/bin/bash

echo -n "Enter Your Filename : "
read FILE1

# echo $FILE1

#[ -x $FILE1 ] && eval $FILE1



if [ -x $FILE1 ] ; then
     . $FILE1
fi 


: <<EOF
if [ -x $FILENAME ] ; then
    . $FILENAME
fi 
EOF