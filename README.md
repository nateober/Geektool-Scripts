# GeekTool Scripts
Written by Nate Ober

## About
>GeekTool is an application for Mac OS 10.6+. 
>It lets you display various kinds of information on your desktop...

### cpuScale 
Generates a stacked graph for CPU usage using mostly top and awk.
Options include setting a console color for highlighting utilization bars; number of lines (or other characters) to be displayed - creating longer or shorter graphs; and character to use for each line. 
	This script is best run in GeekTool with the following command and arguments:
	 ". /path/to/cpuScale.sh [hls][arguments]"
	-h      Highlight color. The color of the pipe line that indicates percent full. 
		   Options are LBLUE, DBLUE, BLACK, GREEN, RED, YELLOW, WHITE. Default is RED.
		   
	-l      Total number of divisor symbols. Default is 40.
   
	-s      The string to use as a divisor symbol. The default is a "__". (As you might expect, you must surround the string in quotes)
	
