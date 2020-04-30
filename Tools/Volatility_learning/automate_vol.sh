#!/bin/bash

image=$1
mkdir ./findings
echo 'Moving into findings directory'
cd ./findings

echo 'Creating Timelines...'
mkdir ./timelines
echo 'Moving into timelines directory'
cd ./timelines
vol.py timeliner --output-file=${image}_timeliner_out.txt --output=body
vol.py mftparser --output-file=${image}_mft_out.txt --output=body
vol.py shellbags --output-file=${image}_shellbags_out.txt --output=body
cat *_out.txt >> ${image}_supertimeline.body
mactime -d -b supertimeline.body supertimeline.csv

echo 'Running imageinfo...'
vol.py -f $1 imageinfo > ./findings/imageinfo.out
profile=$(cat ./findings/imageinfo.out | grep "Profile" | awk '{print $4}' | tr -d ',')
echo 'Profile found: ' $profile
export VOLATILITY_PROFILE=$profile
cd ../..
export VOLATILITY_LOCATION=$image
echo 'Moving back to findings'
cd ./findings

#Instead, below, make array of plugins to plugin
declare -a plugins=("pslist" "psxview" "connscan" "iehistory" "consoles")
for i in "${plugins[@]}"
do
	echo 'Running Volatilty Plugin: ' $i
	vol.py $i > ${i}.out 
done
