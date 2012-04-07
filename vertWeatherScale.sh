#!/bin/sh
TOTAL=35;
ZIP=0;

usage()
{
cat << EOF
usage: $0 options

This script will output a weather forcast vertically within a terminal environment. 
I wrote this for use with Geektool. Please use $0 -z [zipcode] as a minimum set of arguments.

OPTIONS:
   -z      Zipcode. Required.
   -n      Total numbers output. Default is 35.
EOF
}

if [ $# -eq 0 ]; then
   	usage
    exit
fi

while getopts “:z:n:” OPTION
do
     case $OPTION in
         z)
             ZIP="$OPTARG"
             ;;
         n)
             TOTAL="$OPTARG"
             ;;
    	 ?)
             usage
             exit
             ;;
         *)
             usage
             exit
             ;;
     esac
done

if [ $ZIP -eq 0 ]; then
   	usage
    exit
fi

COLD='\033[0;36m';
WARM='\033[0;33m';
HOT='\033[0;31m';
OUTSIDE='\033[0;37m';

WEATHER=`curl -s http://xml.weather.yahoo.com/forecastrss?p=$ZIP`;
CURRTEMP=`echo $WEATHER | grep -o "yweather:condition .*temp=\"[0-9]*\"" | grep -o "temp=\"[0-9]*\"" | sed -e 's/temp=\"//' -e 's/\"$//'`;
HIGH=`echo $WEATHER | grep -o "yweather:forecast .*high=\"[0-9]*\"" | grep -o -m 1 "high=\"[0-9]*\"" | head -1 | sed -e 's/high=\"//' -e 's/\"$//'`;
LOW=`echo $WEATHER | grep -o "yweather:forecast .*low=\"[0-9]*\"" | grep -o -m 1 "low=\"[0-9]*\"" | head -1 | sed -e 's/low=\"//' -e 's/\"$//'`;

let SPREAD=$[$[$TOTAL]-$[$HIGH-$LOW]]/2;
let TOP=$HIGH+$SPREAD;
let BOTTOM=$LOW-$[$TOTAL-$SPREAD]+$[$HIGH-$LOW];




if [ $CURRTEMP -lt 50 ]; then
	TEMP=$COLD;
elif [ $CURRTEMP -ge 50 ] && [ $CURRTEMP -lt 75 ] ; then
	TEMP=$WARM;
else
	TEMP=$HOT;
fi

if [ $CURRTEMP -gt $TOP ]; then
	let DIFF=$CURRTEMP-$TOP;
	let START=$CURRTEMP;
	let END=$BOTTOM+$DIFF;
elif [ $CURRTEMP -lt $BOTTOM ]; then
	let DIFF=$BOTTOM-$CURRTEMP;
	let START=$TOP-$DIFF;
	let END=$CURRTEMP;
else
	START=$TOP;
	END=$BOTTOM
fi

let SCALE=$END+1;

echo "-----"
while [ $START -ge $SCALE ]; do
	if [ $START -eq $CURRTEMP ] && ([ $START -eq $HIGH ] || [ $START -eq $LOW ]); then
		echo "$(echo $TEMP)-$START""˙$(echo  '\033[0m')";
	elif [ $START -eq $CURRTEMP ]; then
		echo " $(echo $TEMP)$START""˙$(echo  '\033[0m')";
	elif [ $START -eq $HIGH ]; then
		echo "$(echo $OUTSIDE)-""$HIGH""-$(echo  '\033[0m')";
	elif [ $START -eq $LOW ]; then
		echo "$(echo $OUTSIDE)-""$LOW""-$(echo  '\033[0m')";
	else
		echo " $START";
	fi
	echo " -";
	let START=$START-1;
done
echo " $END"
echo "-----"