#!/bin/bash
echo "...start"
###############################################################
###############################################################
### 			help
### $1 - input folder
### $2 - prefix to the new name
### $3 - start index number
###
###
### -i - work in interactive mode (ask me for params) (DEFAULT)
### -d - num of Digits (3,4) ### , #### at the name
### -n - use New folder and copy paste new name to new folder
### -s - use the Same folder to rename files  (DEFAULT)
### -r - dry Run
### -l - list Run ; dry run that produce list file
### -d - Debug mode
###
### Modes:
### --go => go mode; look for THM/MOV/GIF
### --
###
###
### output:
###   <newPrefix>_####.XXX
###
###
###
###
###############################################################
###############################################################

#inputs
inFolder=$1
prefix=$2
indexNum=$(($3 - 1 ))
echo  "startNum=$startNum"

#consts
padwidth=4

###############################################################
###############################################################
#Interactive Mode

#goMode
curVideoName="none"
curTimeLapse="none"
timeLapseSuffix=0

###############################################################
###############################################################
#listFiles by modfication date reverse order
for file in `ls -X $inFolder` ; do
	#print
	echo -n $file 
	echo -n " ==> " 
	
	#split:
	filename=$(basename "$file")
	extension="${file##*.}"
	filename="${file%.*}"

	#file parts:	
	echo -n "[" $filename "]"
	echo -n "."
	echo -n "[" $extension "]"

#goMode
if [ $extension = "THM" ] || [ $extension = "MP4" ] || [ $extension = "LRV" ] || [ $extension = "mp4" ]; then
	if [ $filename = $curVideoName ]; then
		echo -n ";|video;"
	else
		curVideoName=$filename
		indexNum=$(($indexNum + 1 ))
		echo -n ";*video;"
	fi
		
#inCaseVideoAfterTimeLapse
timeLapseSuffix=0

fi



### photos
if [ $extension = "JPG" ] || [ $extension = "jpeg" ] || [ $extension = "jpg" ]  || [ $extension = "gif" ] || [ $extension = "NEF" ] ; then
	echo -n ";photo;"

	indexNum=$(($indexNum + 1 ))

	#trim starting "go"
	photoPrefix=${filename:0:2}
	imgStr1=${filename:2:3}
	imgStr2=${filename:5:3}
	echo -n $photoPrefix":"$imgStr1":"$imgStr2

	if [ $photoPrefix = "G0" ]; then
	#timelapse:
		echo -n ":TimeLapse"
    echo -n ";(curTimeLapse)=$curTimeLapse"
    echo -n ";(imgStr1=$imgStr1)"
		if [ $imgStr1 = $curTimeLapse ]; then
			timeLapseSuffix=$(($timeLapseSuffix + 1 ))
	    indexNum=$(($indexNum - 1 ))
		else
			curTimeLapse=$imgStr1
			timeLapseSuffix=1
      ##timelapse to vid
      echo " "
      TIMELAPSE_PAT=`printf "%s_%0*d_" $prefix $padwidth $indexNum`"%d.JPG"
      TIMELAPSE_OUT=`printf "%s_%0*d.mp4" $prefix $padwidth $indexNum`
      echo "TIMELAPSE VID: pattern = $TIMELAPSE_PAT ; out= $TIMELAPSE_OUT"
      ffmpegCmd="ffmpeg -framerate 10 -i \"$TIMELAPSE_PAT\" -s:v 1440x1080 -c:v libx264 -crf 17 -pix_fmt yuv420p $TIMELAPSE_OUT" 
      echo cmd="$ffmpegCmd" 
      echo $ffmpegCmd >> ffmpegCmd.run
    fi
	else
	#notTimelaspe
		timeLapseSuffix=0
	fi
fi

	#indexNum PaddingFix:
	indexNumPad=`printf "%0*d" $padwidth $indexNum`
	
	#newname:
	echo -n " ===> " 
	echo -n $prefix
	echo -n "_"
	echo -n $indexNumPad
	echo -n "."
	echo -n $extension
	#newName
	newFile=${prefix}_${indexNumPad}.${extension}	
	if [ $timeLapseSuffix -ne "0" ]; then
	newFile=${prefix}_${indexNumPad}_${timeLapseSuffix}.${extension}	
	fi
	echo -n "==>"
	echo -n $newFile
	echo " "

	echo "mv $inFolder/$file $inFolder/$newFile"
	mv $inFolder/$file $inFolder/$newFile

		
done



