#!/bin/bash

if [ -d temp ]; then
	echo deleting existing temp directory
	rm -r temp
fi

echo creating temp directory
mkdir temp

files=$(find . -mindepth 1 -maxdepth 1 -type f -not -path "./.DS_Store" | sed 's/.gif//g' | sed 's/.\///g')


for file in $files
do
	echo "ffmpeg -i $file.gif -vsync 0 temp/$file%d.png"
	ffmpeg -i $file.gif -vsync 0 temp/$file%d.png
done


