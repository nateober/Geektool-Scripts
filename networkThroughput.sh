#!/bin/sh
# Created By Nate Ober
# Nate [dot] Ober [at] Gmail

IFACE=`route -n get default | grep -o "interface: .*" | awk '{print $2}'`
BYTES_START=`netstat -ibI "$IFACE" | tail -1 | awk '{print $7 " " $10}'`
sleep 1
BYTES_STOP=`netstat -ibI "$IFACE" | tail -1 | awk '{print $7 " " $10}'`
FLOW=`echo $BYTES_START $BYTES_STOP | awk '{ print ($3-$1)/1024 " " ($4-$2)/1024}'`
echo "$FLOW" | awk '{printf "in:%.2f\nkbps out:%.2f", $1, $2}'