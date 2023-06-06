#!/bin/bash

## $1 - string name
## $2 - start number

count=$2
for dir in ./*; do
	echo "./goProRENAMER.sh $dir $1 $count"
	./goProRENAMER.sh $dir $1 $count

	new=`ls -1 $dir |wc -l`
	count=$(($count +$new + 1))
done
