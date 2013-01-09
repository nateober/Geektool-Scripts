#!/bin/sh
# Created By Nate Ober
# Nate [dot] Ober [at] Gmail

TOTAL=20;
ZIP=0;

usage()
{
cat << EOF
usage: $0 options

This script will output a weather forcast vertically within a terminal environment. 
I wrote this for use with Geektool. Please use $0 -z [zipcode] as a minimum set of arguments.

OPTIONS:
   -z      Zipcode. Required.
   -n      Total numbers output. Default is 20.
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
	
# Set Temperature and Range Colors
# Blue, Yellow, Red for Temperatures
# White for High and Low (unless the current temperature is high or low)
	
COLD='\033[0;36m';
WARM='\033[0;33m';
HOT='\033[0;31m';
OUTSIDE='\033[0;37m';

WEATHER=`curl -s http://xml.weather.yahoo.com/forecastrss?p=$ZIP`;
if [ "$WEATHER" != '' ]; then
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
		let CURSOR=$CURRTEMP;
		let END=$BOTTOM+$DIFF;
	elif [ $CURRTEMP -lt $BOTTOM ]; then
		let DIFF=$BOTTOM-$CURRTEMP;
		let CURSOR=$TOP-$DIFF;
		let END=$CURRTEMP;
	else
		CURSOR=$TOP;
		END=$BOTTOM
	fi

	echo "-----"
	while [ $CURSOR -ge $END ]; do
		if [ $CURSOR -eq $CURRTEMP ] && ([ $CURSOR -eq $HIGH ] || [ $CURSOR -eq $LOW ]); then
			echo "$(echo $TEMP)-$CURSOR""˙$(echo  '\033[0m')";
		elif [ $CURSOR -eq $CURRTEMP ]; then
			echo " $(echo $TEMP)$CURSOR""˙$(echo  '\033[0m')";
		elif [ $CURSOR -eq $HIGH ]; then
			echo "$(echo $OUTSIDE)-""$HIGH""-$(echo  '\033[0m')";
		elif [ $CURSOR -eq $LOW ]; then
			echo "$(echo $OUTSIDE)-""$LOW""-$(echo  '\033[0m')";
		else
			echo " $CURSOR";
		fi
		if [ $CURSOR -ne $END ]; then
			echo " -";
		fi
		let CURSOR=$CURSOR-1;
	done
	echo "-----"
else
	CC=" Can't Connect ";
	i=0;
	while [ $i -lt ${#CC} ]; do 
		echo $(echo "$WARM")${CC:$i:1}$(echo  '\033[0m')  
		 i=$[$i+1];
	done
fi