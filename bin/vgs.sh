#!/bin/bash

TMP3=/test/tmp3
TMP4=/test/tmp4

echo "vg list"

vgs | tail -n +2 | awk '{print $1}' > $TMP3
pvs > $TMP4

sed "/$TMP3/d" $TMP4
