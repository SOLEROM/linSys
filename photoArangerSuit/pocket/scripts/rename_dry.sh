#!/bin/bash
###############################################################
###############################################################
### 			help
### $1 - input folder
### $2 - prefix to the new name
### $3 - start index number
###
### output:
###   <newPrefix>_####.XXX
###
###
###############################################################
###############################################################

#inputs
inFolder=$1
prefix=$2
indexNum=$(($3 - 1 ))

#consts
padwidth=4

###############################################################
###############################################################
#listFiles by modfication date reverse order
for file in `ls -X $inFolder` ; do
slowmo=false
rename=false
	
	#split:
	filename=$(basename "$file")
	extension="${file##*.}"
	filename="${file%.*}"


### video
if [ $extension = "MP4" ] || [ $extension = "mp4" ]; then
        echo -n $file 
        echo -n " ==> " 
        #file parts:    
        echo -n "[" $filename "]"
        echo -n "."
        echo -n "[" $extension "]"
	if test -f "$inFolder/$filename.AAC"; then
		#slowmo (AAC audio file included)
		echo -n ";|found AAC for this MP4;"
		slowmo=true
	else
		echo -n ";reg video;"
	fi
	indexNum=$(($indexNum + 1 ))
	rename=true
fi



### photos
if [ $extension = "JPG" ] || [ $extension = "jpeg" ] || [ $extension = "jpg" ] ; then
        echo -n $file 
        echo -n " ==> " 
	#file parts:    
        echo -n "[" $filename "]"
        echo -n "."
        echo -n "[" $extension "]"
	echo -n ";photo;"
	indexNum=$(($indexNum + 1 ))
	rename=true
fi

### rename
if $rename ; then
	#indexNum PaddingFix:
	indexNumPad=`printf "%0*d" $padwidth $indexNum`
	
	#newName
	newFile=${prefix}_${indexNumPad}.${extension}	
	echo -n "==>"
	echo -n $newFile
	echo " "
	
	echo "mv $inFolder/$file $inFolder/$newFile"
#	mv $inFolder/$file $inFolder/$newFile

	if $slowmo ; then
	     echo "mv $inFolder/$filename.AAC $inFolder/${prefix}_${indexNumPad}.AAC"
#	     mv $inFolder/$filename.AAC $inFolder/${prefix}_${indexNumPad}.AAC
	fi
fi


done



