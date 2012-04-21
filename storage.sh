#!/bin/sh
# Created By Nate Ober
# Nate [dot] Ober [at] Gmail

LBLUE='\033[0;36m';
DBLUE='\033[0;34m';
BLACK='\033[0;30m';
GREEN='\033[0;32m';
RED='\033[0;31m';
YELLOW='\033[0;33m';
WHITE='\033[0;37m';

LINES=40;
HIGHLIGHT=RED;
SYMBOL="|";

usage()
{
cat << EOF
usage: $0 options

This script will output a series of pipe lines with the line that represents the percent full highlighted in one of several colors. 
I wrote this for use with Geektool. It is best operated in Geektool by using the "dot" convention ". /path/to/script.sh".

OPTIONS:
   -h      Highlight color. The color of the pipe line that indicates percent full. 
		   Options are LBLUE, DBLUE, BLACK, GREEN, RED, YELLOW, WHITE. Default is RED.
		   
   -l      Total number of pipe lines. Default is 40.
   
   -s      The string to use as a divisor symbol. The default is a "|". (As you might expect, you must surround the string in quotes)
   
EOF
}

while getopts “:h:l:s:” OPTION
do
     case $OPTION in
         h)
             HIGHLIGHT=$(echo "$OPTARG" | tr '[a-z]' '[A-Z]')
             ;;
         l)
             LINES="$OPTARG"
             ;;
    	 s)
             SYMBOL=$(printf '%s' $OPTARG)
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

if ! [[ "$LINES" =~ ^[0-9]+$ ]] ; then
   	usage
    exit
fi

case $HIGHLIGHT in
	LBLUE)
		HIGHLIGHT=$LBLUE
		;;
	DBLUE)
		HIGHLIGHT=$DBLUE
		;;
	BLACK)
		HIGHLIGHT=$BLACK
		;;
	GREEN)
		HIGHLIGHT=$GREEN
		;;
	RED)
		HIGHLIGHT=$RED
		;;
	YELLOW)
		HIGHLIGHT=$YELLOW
		;;
	WHITE)
		HIGHLIGHT=$WHITE
		;;
	*)
		usage
		exit
		;;
esac


DIVTOT=`df -h / | awk -v lines="$LINES" 'NR==2{printf "%.0f\n", ($5/100)*lines}'`
echo "hd \c"
for ((i=1;i<$LINES;i++));do 
	if [ $i -le $DIVTOT ]; then
		echo "$(echo $HIGHLIGHT)$SYMBOL$(echo  '\033[0m') \c"; 
	else 
		echo "$SYMBOL \c";
	fi
done
echo "$(df -h / | awk 'NR==2{printf "%s",$5}')";