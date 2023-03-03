#!/bin/bash

if [ $# -ne 2 ] ; then
    echo " Usage $0 <start/stop><service>"
    exit 1
fi 

SCRIPTNAME=$0
ACTION=$1
SVC=$2

SVC_START() {
    systemctl enable $SVC > /dev/null 2>1&
    if [ $? -eq 0 ] ; then
        systemctl restart $SVC
        systemctl status $SVC
    else
        echo "[FAIL]"
        exit 2
    fi
}

SVC_STOP(){
    systemctl disable $SVC > /dev/null 2>1&
    if [ $? -eq 0 ] ; then
        systemctl stop $SVC
        systemctl status $SVC    
    else
        echo "[FAIL]"
        exit 3
    fi
}

SVC_ERR(){
    echo " ERROR "
    exit 4
}

case $ACTION in 
    start) SVC_START ;; 
    stop) SVC_STOP ;;
    *)  SVC_ERR ;;
esac
