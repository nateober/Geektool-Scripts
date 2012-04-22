#!/bin/sh
# Created By Nate Ober
# Nate [dot] Ober [at] Gmail

IFACE=`route -n get default | grep -o "interface: .*" | awk '{print $2}'`;
BYTES_START=`netstat -ibI "$IFACE" | awk 'NR==2{print $7 " " $10}'`;
sleep 1;
BYTES_STOP=`netstat -ibI "$IFACE" | awk 'NR==2{print $7 " " $10}'`;
KBYTES_FLOW=`echo $BYTES_START $BYTES_STOP | awk '{ print ($3-$1)/1024 " " ($4-$2)/1024}'`;
echo "Network Flow";
echo "$KBYTES_FLOW" | awk '{printf "%.2f kbps.in\n%.2f kbps.out", $1, $2}';