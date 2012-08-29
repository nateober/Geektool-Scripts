#!/bin/sh
# Created By Nate Ober
# Nate [dot] Ober [at] Gmail

# In order for this script to function, you need to have adb installed and in your path.
# You can get adb in the Android SDK
# I source my .bash_profile script to get access to adb.

for device in $(adb devices | awk '/device$/ {print $1}')
do
	adb -s $device shell cat /system/build.prop | awk -F "=" '/ro\.product\.model/ {print $2}'
	echo "Serial Number: $device"
	adb -s $device shell dumpsys battery | awk -F ": " '/level/{printf "Battery: %d%%\n", $2}'
	adb -s $device shell dumpsys cpuinfo | awk '/% TOTAL:/{printf "CPU Utilization: %s\n", $1}' 
	adb -s $device shell netcfg | awk '!/0\.0\.0\.0/ && !/127\.0\.0/{printf "IP Address: %s", $3}' | sed "s/\/.*//"
	echo 
done
