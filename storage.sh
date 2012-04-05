#!/bin/sh
DIVTOT=`df -h / | awk '{print $5}' | tail -1 | awk '{ printf "%.0f\n", ($1/100)*40 }'`
echo "hd \c"
for i in {1..40};do 
	if [ $i -eq $DIVTOT ]; then
		echo "$(echo '\033[1;31m')|$(echo  '\033[0m') \c"; 
	else 
		echo "| \c";
	fi
done
echo "$(df -h / | tail -1 | awk '{printf "%s",$5}')";