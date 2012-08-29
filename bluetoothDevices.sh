#!/bin/sh
# Created By Nate Ober
# Nate [dot] Ober [at] Gmail

echo "Bluetooth "
echo "Device | Battery Remaining"
echo "--------------------------"
ioreg -c IOAppleBluetoothHIDDriver | awk -F " = " '/"Product" = / {print $2"  |  "} /"BatteryPercent" = / {print $2"%"}' |  sed 'N;s/\n/ /;' | sed -e 's/"//g'