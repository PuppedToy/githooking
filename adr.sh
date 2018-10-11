#!/bin/bash

files=$(ls *.rndtxt)
rndn=$RANDOM
let "rndn %= 4"

if [ "$files" == "" ] || [ $rndn -gt 2 ]; then
	new=$(node add_random_change 8)".rndtxt"
	echo $(node add_random_change) > $new
	echo "New file! --> $new"
else
	nfiles=$(echo files | wc -w | xargs)
	rndn=$RANDOM
	let "rndn %= $nfiles"
	old=$(echo $files | tr " " "\n"|sed -n "${rndn}p")
	echo $(node add_random_change) >> $old
	echo "Old file! --> $old"
fi
	


exit 0
