#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "Usage <Pattern><file>"
fi

: << EOF
pattern=$1
file=$2

grep $pattern $file > /dev/null 2>&1

if [ $? -eq 0 ] ; then
    echo " OK "
else
    echo " FAIL "  
fi
EOF

if grep $1 $2 > /dev/null 2>&1 ; then
    echo " OK "
else
    echo " FAIL "
fi 


