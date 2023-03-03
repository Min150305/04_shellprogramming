#!/bin/bash

lvremove /dev/vg1/lv1 -f
vgremove vg1
pvremove /dev/sdb1 /dev/sdc1