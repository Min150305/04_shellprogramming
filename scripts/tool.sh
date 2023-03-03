#!/bin/bash

clear

cat << EOF
====================================================
  (1). who      (2). date     (3). pwd              
====================================================
EOF

echo  -n "Choice ? (1/2/3) : "
read CHOICE

case $CHOICE in
    1) who ;;
    2) date ;;
    3) pwd ;;
    4) echo " Sorry "
       exit 2 ;;
esac

