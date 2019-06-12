#!/bin/bash

#This script will change all the files in the directory (arg 2) to have the extension given (arg 1).

# usage function - displays the correct way to run the script
#Get Args
ext=$1
dir=$2
echo "$ext" "$dir"


function usage()
{
cat << EOF
Usage: ${0} <extension> <directory>
EOF
}

#Check number of args
if [[ $# != 2 ]] ; then
	usage
	exit
fi

#Check if the second arg is a directory
if [[ ! -d $dir ]]; then
  echo "$dir does not appear to be a directory"
  exit
fi


for f in `ls $2` ; do

	if [[ "$f" == *".$ext" ]] ; then
		echo "the file has already the same extension"
		continue
	fi
	
     	newf="${f%.*}"
	echo "$newf.$ext"	
	mv "$f" "$newf.$ext"
	#mv "$f" "${f%.*}.$ext" why this is not working :(
	echo $f
done


