#!/bin/sh
# Created By Nate Ober
# Nate [dot] Ober [at] Gmail

# In order for this script to function, you need to have adb installed and in your path.
# You can get adb in the Android SDK
# I source my .bash_profile script to get access to adb.

adb devices | awk /"device$"/'{print "Android Phone Connected\nDevice ID: "$1}' && \
adb shell dumpsys battery | grep level | awk -F ": " '{printf "Battery: %d%%\n", $2}' && \
adb shell dumpsys cpuinfo | awk '/% TOTAL:/{printf "CPU Utilization: %s\n", $1}' && \
adb shell netcfg | awk '!/0\.0\.0\.0/ && !/127\.0\.0/{printf "IP Address: %s", $3}'

