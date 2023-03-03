#!/bin/bash

# # PV -> VG -> LV 

TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
TMP3=/tmp/tmp3
TMP4=/tmp/tmp4

# 1. PV
# 2. VG
# 3. LV 

###############
# 1. PV
#  1-1. View
#  1-2. Works
###############
# 2. VG
#  2-1. View
#  2-2. Works
###############
# 3. LV 
#  3-1. View
#  3-2. Works
###############

while true
do
echo "############## PV 생성 ##############"
echo ""
# 1-1
fdisk -l | grep LVM | awk '{print $1}' > $TMP1 
pvs | tail -n +2 | awk '{print $1}' > $TMP2
cat $TMP1 $TMP2 | sort | uniq -u

cat << EOF 
############## PV VIEW ##############
$(cat $TMP1 $TMP2 | sort | uniq -u)
#####################################
EOF

echo ""
# 1-2 
echo "위의 목록에서 PV로 생성하고 싶은 볼륨을 선택합니다."
echo -n "볼륨 선택? (ex: /dev/sdb1 /dev/sdc1 ...) : "
read VOLUME 

echo -n "1.중지 2.실행 3.SKIP : "
read CHOICE
    case $CHOICE in
        1) continue ;;
        2) : ;;
        3) break ;;
        *) echo "[Retry]"
        exit 4 ;;
    esac

pvcreate $VOLUME  >/dev/null 2>&1

if [ $? -eq 0 ] ; then
    echo "[ OK ] physical volume "$VOLUME" successfully created."
    pvs
else
    echo "[ FAIL ] physical volume not created "
    exit 1
fi
break
done 

echo "############## VG 생성 ##############"
# 2-1 
vgs | tail -n +2 | awk '{print $1}' > $TMP3
pvs > $TMP4

for i in $(cat $TMP3)
do
    sed -i "/$i/d" $TMP4
done

cat << EOF 
############## PV LIST ##############
$(cat $TMP4)
#####################################
EOF

# 2-2 
# vgcreate vg1 /dev/sdb1 /dev/sdc1
echo -n "VG 이름은? (ex: vg1)"
read VGNAME

echo -n "선택가능한 PV 목록을 적어 주세요 (ex: /dev/sdb1 /dev/sdc1 ... ) :"
read PVLIST 

vgcreate $VGNAME $PVLIST

if [ $? -eq 0 ] ; then
    echo "[OK] Volume group $VGNAME successfully created "
    echo "====================================="
    vgs
    echo "====================================="
else
    echo "[FAIL] Volume group not created"
    exit 2
fi

echo " ############## LV 생성 ##############"
# 3-1 
cat << EOF 
############## PV LIST ##############
$(vgs | awk '$7 != '0' {print $0}')
#####################################
EOF

# 3-2
# lvcreate vg1 -n lv1 -L 100M 

echo -n "LV로 만들 VG이름은? (ex: vg1) : "
read VGLV 

echo -n "생성할 LV의 이름은? (ex: lv1) : "
read LVNAME

echo -n "LV 용량은? (ex: 500m) : "
read LVSIZE 

lvcreate $VGLV -n $LVNAME -L $LVSIZE

if [ $? -eq 0 ] ; then
    echo "[OK] Logical volume "$LVNAME" created."
    echo "=================================="
    lvs
    echo "=================================="
else
    echo "[FAIL] Logical Volume not created "
fi

