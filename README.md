# GeekTool Scripts

A collection of scripts I wrote for use with Geektool on my Macs.

<img src="http://dl.dropbox.com/u/2970815/Geektool.png" alt="Background Example" />

## About
>GeekTool is an application for Mac OS 10.6+. 
>It lets you display various kinds of information on your desktop...

You can get GeekTool for your Mac from the [App Store](http://itunes.apple.com/us/app/geektool/id456877552?mt=12) or at the [GeekTool Project webpage] (http://projects.tynsoe.org/en/geektool/).

## Files
### Resource graphs
The below flies are graphs that monitor your CPU, Memory and Storage utilization.

#### [cpuScale.sh] (https://github.com/nateober/Geektool-Scripts/blob/master/cpuScale.sh)
Generates a stacked graph for CPU usage using mostly top and awk.
Options include setting a console color for highlighting utilization bars; number of lines (or other characters) to be displayed - creating longer or shorter graphs; and character to use for each line. 
This script is best run in GeekTool with the following command and arguments:

	. /path/to/cpuScale.sh [hls][arguments]
	
	-h      Highlight color. The color of the divisor symbols that indicate percent full. 
	Options are LBLUE, DBLUE, BLACK, GREEN, RED, YELLOW, WHITE. Default is RED.
	
	-l      Total number of divisor symbols. Default is 40.
	
	-s      The string to use as a divisor symbol. The default is a "__". (As you might expect, you must surround the
	string in quotes)

#### [memScale.sh] (https://github.com/nateober/Geektool-Scripts/blob/master/memScale.sh)
Generates a stacked graph for Memory usage using mostly top and awk.
Options include setting a console color for highlighting utilization bars; number of lines (or other characters) to be displayed - creating longer or shorter graphs; and character to use for each line. 
This script is best run in GeekTool with the following command and arguments:

	. /path/to/memScale.sh [hls][arguments]
	
	-h      Highlight color. The color of the divisor symbols that indicate percent full. 
	Options are LBLUE, DBLUE, BLACK, GREEN, RED, YELLOW, WHITE. Default is RED.
	
	-l      Total number of divisor symbols. Default is 40.
	
	-s      The string to use as a divisor symbol. The default is a "__". (As you might expect, you must surround the
	string in quotes)

#### [storage.sh](https://github.com/nateober/Geektool-Scripts/blob/master/storage.sh)
Generates a stacked graph for Hard Drive usage using mostly df and awk.
Options include setting a console color for highlighting utilization bars; number of lines (or other characters) to be displayed - creating longer or shorter graphs; character to use for each line; mount path to report on; and alias for chart. 
This script is best run in GeekTool with the following command and arguments:

	. /path/to/storage.sh [hls][arguments]
	
	-h      Highlight color. The color of the pipe line that indicates percent full. 
		   Options are LBLUE, DBLUE, BLACK, GREEN, RED, YELLOW, WHITE. Default is RED.
		   
	-l      Total number of divisor symbols. Default is 40.

	-s      The string to use as a divisor symbol. The default is a "__". (As you might expect, you must surround the string in quotes)
   
	-m	   Mount location. The default is "/", the home directory. Remember to quote any directory that contains spaces. (Example -m "/Volumes/Time Machine Backups")
   
	-n	   Name of device. This is an alias used to visually identify this device. The default is "HD".
   		   If you use multile instantiations of this script you may want to identify each device by a short
   		   identifier. It looks best, at the moment, if you use two characters such as "HD" or "TM" (for Time Machine).
	
### Other Console Color Scripts
Below is a local temperature (as in weather) script and yet another calendar script. Brought to you in console color.

#### [vertWeatherScale.sh](https://github.com/nateober/Geektool-Scripts/blob/master/vertWeatherScale.sh)
Generates a vertical number line with the high and low for the day and current temperature highlighted.
Options include the size of the number line and the zipcode (required). All information is acquired through the Yahoo weather api. (http://xml.weather.yahoo.com/forecastrss).
Temperature is in degrees Fahrenheit.
This script is best run in GeekTool with the following command and arguments:

	. /path/to/vertWeatherScale.sh [zn][arguments]
	
	-z      Zipcode. Required.
	-n      Total numbers output. Default is 35.

#### [horizontalCalender.sh](https://github.com/nateober/Geektool-Scripts/blob/master/horizontalCalender.sh)
Generates a horizontal calendar of sorts. Although it tells you the month, date and day of the week, it is mostly for looks.
This script is best run in GeekTool with the following command:

	. /path/to/horizontalCalender.sh
	
### Miscellaneous and small scripts or commands. 
Below are a number of miscellaneous scripts that I use but haven't spent a lot of time cleaning up.

####[networkThroughput.sh](https://github.com/nateober/Geektool-Scripts/blob/master/networkThroughput.sh)
Generates text that gives you the kbps of your connection. It uses route to find your current interface and then netstat, grep and awk to format and print the text.
This script is best run in GeekTool with the following command:

	. /path/to/networkThroughput.sh

####[networkInfo.sh](https://github.com/nateober/Geektool-Scripts/blob/master/networkInfo.sh)
Generates text that gives you the internal, external and mac address for your default interface. It uses route to find your current interface and then ifconfig and awk to format and print the text.
This script is best run in GeekTool with the following command:
	
	. /path/to/networkInfo.sh
	
####[android_phone.sh](https://github.com/nateober/Geektool-Scripts/blob/master/android_phone.sh)
Generates text that gives you the device ID, Battery Percentage, CPU utilization and IP Address of an Android phone attached to your computer. This tool requires [adb](http://developer.android.com/tools/help/adb.html) tso be installed and defined in the instance path. I define mine by sourcing my bash_profile which has the path defined.
You can get [adb](http://developer.android.com/tools/help/adb.html) by installing the Android SDK located at: http://developer.android.com/sdk/index.html.  
This script is best run in GeekTool with the following command:
	
	. /path/to/android_phone.sh
	