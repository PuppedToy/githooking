#!/bin/bash

iterations=1
re='^[0-9]+$'
if [ "$2" != "" ] && [[ "$2" =~ $re ]] ; then
	iterations=$2
fi

counter=0
while [ $counter -lt $iterations ]; do

	files=$(ls *.rndtxt 2> /dev/null)
	rndn=$RANDOM
	let "rndn %= 4"

	if [ "$1" == "-m" ] || [ "$1" == "-c" ]; then
		rndn=0
	elif [ "$1" == "-n" ]; then
		rndn=3
	fi

	if [ "$files" != "" ] && [ $rndn -le 2 ]; then
		nfiles=$(echo $files | wc -w | xargs)
		rndn=$RANDOM
		let "rndn %= $nfiles"
		((rndn++))
		old=$(echo $files | tr " " "\n"|sed -n "${rndn}p")
		echo $(node add_random_change) >> $old
		echo "Modified file: $old"
	else
		new=$(node add_random_change 8)".rndtxt"
		echo $(node add_random_change) > $new
		echo "Created file: $new"
	fi

	if [ "$1" == "-c" ]; then
		ncommit=$(cat .autocommit)
		git commit -a -m "AutoCommit #$ncommit"
		((ncommit++))
		echo -n $ncommit > .autocommit
	fi

	((counter++))

done

exit 0
