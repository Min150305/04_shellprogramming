#!/bin/bash
# #./check_service.sh  192.168.10.10 192.168.10.20 [비교IP] 
# ---------------
# 192.168.10.10
# ---------------
# svc1 active
# svc2 active
#
# ---------------
# 192.168.10.20
# ---------------
# svc3 active
# svc4 active
#

if [ $# -ne 2 ] ; then
    echo "Usage: $0 <IP1><IP2>"
    exit1
fi

export FIRST_IP=$1
export SECOND_IP=$2
export BASEDIR=/root/bin

ServiceList(){
# Input: str         #ServiceList main
# Output: file       #ServiceList main -> main.txt
# functions:
SERVER=$1
ssh $SERVER systemctl -t service | sed -n '1,/^LOAD/p' \
                                 | sed '$d' \
                                 | awk '{print $1, $3}' > $BASEDIR/$SERVER.txt
}

ServiceList $FIRST_IP
ServiceList $SECOND_IP

FSERVER=$BASEDIR/$FIRST_IP.txt
SSERVER=$BASEDIR/$SECOND_IP.txt

cat << EOF 
############################
    "$FIRST_IP"
############################
$(diff $FSERVER $SSERVER | fgrep "<" | cut -c3-)

############################
    "$SECOND_IP"
############################
$(diff $FSERVER $SSERVER | fgrep ">" | cut -c3-)

EOF

# ############################
# "$FIRST_IP" + "$SECOND_IP"
# ############################
# $(cat $FSERVER $SSERVER | sort | uniq -d )
    




