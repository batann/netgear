#!/bin/bash
#
# Log amount of data transferred by Netgear M1 mobile router
#

NETGEAR_M1=../../netgear-m1/netgear-m1.sh
FILE=data.js

if [ ! -f "$FILE" ]; then
  echo "const d = []" >$FILE
fi

while true; do
  DATE=$(date +"%FT%T")
  DATA=$($NETGEAR_M1 status |grep "Data transferred: " |sed 's/.*: //')
  echo "d.push([new Date('$DATE'), $DATA])" >> $FILE
  sleep 10
done
