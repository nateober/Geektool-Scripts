#!/bin/sh

LBLUE='\033[0;36m';
DBLUE='\033[0;34m';
BLACK='\033[0;30m';
GREEN='\033[0;32m';
RED='\033[0;31m';
YELLOW='\033[0;33m';
WHITE='\033[0;37m';

LINES=40;
HIGHLIGHT=$RED;

usage()
{
cat << EOF
usage: $0 options

This script will output a series of pipe lines with the line that represents the percent full highlighted in one of several colors. 
I wrote this for use with Geektool. It is best operated in Geektool by using the "dot" convention ". /path/to/script.sh".

OPTIONS:
   -h      Highlight color. The color of the pipe line that indicates percent full. 
		   Options are LBLUE, DBLUE, BLACK, GREEN, RED, YELLOW, WHITE.
		   
   -l      Total number of pipe lines. Default is 40.
   
EOF
}

while getopts “:h:l:” OPTION
do
     case $OPTION in
         h)
             HIGHLIGHT=$(echo "$OPTARG" | tr '[a-z]' '[A-Z]')
             ;;
         l)
             LINES="$OPTARG"
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


DIVTOT=`df -h / | awk '{print $5}' | tail -1 | awk -v lines="$LINES" '{ printf "%.0f\n", ($1/100)*lines }'`
echo "hd \c"
for ((i=1;i<$LINES;i++));do 
	if [ $i -eq $DIVTOT ]; then
		echo "$(echo $HIGHLIGHT)|$(echo  '\033[0m') \c"; 
	else 
		echo "| \c";
	fi
done
echo "$(df -h / | tail -1 | awk '{printf "%s",$5}')";