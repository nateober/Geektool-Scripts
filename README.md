# GeekTool Scripts
Written by Nate Ober

## About
>GeekTool is an application for Mac OS 10.6+. 
>It lets you display various kinds of information on your desktop...
You can get GeekTool for your Mac from the [App Store](http://itunes.apple.com/us/app/geektool/id456877552?mt=12) or at the [GeekTool Project webpage] (http://projects.tynsoe.org/en/geektool/).

## Files
### cpuScale.sh 
Generates a stacked graph for CPU usage using mostly top and awk.
Options include setting a console color for highlighting utilization bars; number of lines (or other characters) to be displayed - creating longer or shorter graphs; and character to use for each line. 
	
	This script is best run in GeekTool with the following command and arguments:
	". /path/to/cpuScale.sh [hls][arguments]"
	
	-h      Highlight color. The color of the divisor symbols that indicate percent full. 
	Options are LBLUE, DBLUE, BLACK, GREEN, RED, YELLOW, WHITE. Default is RED.
	
	-l      Total number of divisor symbols. Default is 40.
	
	-s      The string to use as a divisor symbol. The default is a "__". (As you might expect, you must surround the string in quotes)

### memScale.sh
Generates a stacked graph for Memory usage using mostly top and awk.
Options include setting a console color for highlighting utilization bars; number of lines (or other characters) to be displayed - creating longer or shorter graphs; and character to use for each line. 
	
	This script is best run in GeekTool with the following command and arguments:
	". /path/to/memScale.sh [hls][arguments]"
	
	-h      Highlight color. The color of the divisor symbols that indicate percent full. 
	Options are LBLUE, DBLUE, BLACK, GREEN, RED, YELLOW, WHITE. Default is RED.
	
	-l      Total number of divisor symbols. Default is 40.
	
	-s      The string to use as a divisor symbol. The default is a "__". (As you might expect, you must surround the string in quotes)

