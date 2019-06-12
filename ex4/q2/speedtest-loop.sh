#!/bin/bash

# This script creates a csv file for download and upload speeds
# It should print out date,hour,download,upload (comma-separated)
# And then the values
# It uses speedtest-cli (can be downloaded by using apt)
# Example of output

#date,time,download,upload
#24.04.2019,14:09:52,33.56,3.31
#24.04.2019,14:10:32,38.22,2.94
#24.04.2019,14:11:10,37.42,3.11
#24.04.2019,14:11:53,38.12,3.11
#24.04.2019,14:12:31,37.82,3.13
#24.04.2019,14:13:08,37.63,3.24
#24.04.2019,14:13:45,37.34,3.51
#24.04.2019,14:14:21,37.00,3.08
#24.04.2019,14:14:59,37.35,3.02
#24.04.2019,14:15:37,38.32,3.33
#24.04.2019,14:16:28,36.65,3.36


# usage function - displays the correct way to run the script
#Get Args
lines=$1
slp=$2

function usage()
{
cat << EOF
Usage: ${0} <number of lines> <interval>
EOF
}

function testspeed()
{
x=`speedtest-cli > output.txt`

down=`grep "Download:" output.txt | cut -d" " -f2`
up=`grep "Upload:" output.txt | cut -d" " -f2`
t=`date +%T`
d=`date +"%d.%m.%y"`

echo "$d,$t,$down,$up" >> speedtestresult.csv
}

echo "#date,time,download,upload" > speedtestresult.csv

#Check number of args
if [[ $# != 2 ]] ; then
	usage
	exit
fi
# if lines arg is zero, then run indefinitely
if [[ $lines == 0 ]] ; then 
	while true; do
		testspeed
		sleep $slp
	done
elif [[ $lines > 0 ]] ; then
	for (( i=1; i<=$lines; i++ ))
	do
		testspeed
		sleep $slp
	done

else
	echo "Please provide a valid number of lines"
	exit 0
fi

