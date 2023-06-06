#!/bin/bash
###############################################################
###############################################################
### 			help
### $1 - input folder
### $2 - prefix to the new name
### $3 - start index number
### $4 - dry mode 
###
###
###############################################################
###############################################################

#inputs
inFolder=$1
prefix=$2
indexNum=$(($3 - 1 ))
drySwitch=$4
#consts
padwidth=4
#folders
highRES=mp4
lowRES=mp4LOW
imgFld=imgs

###############################################################
function help {
echo "osmoOrder.sh <workingFolder> <prefix> <startIndex> <dry>"
exit
}
###############################################################
function mvv {
from=$1
to=$2
dry=$3
if $dry ; then
  	echo -n "dry mode ==> "
	echo "mv $from $to"
else
	echo "mv $from $to"
	mv $from $to

fi

}

###############################################################
function cpp {
from=$1
to=$2
dry=$3
if $dry ; then
        echo -n "dry mode ==> "
        echo "cp $from $to"
else
        echo "cp $from $to"
        cp $from $to

fi

}

###############################################################
if [[ $# -le 2 ]] ; then
help
fi
###############################################################
#listFiles by modfication date reverse order
folderList=`ls -X $inFolder`
#new folders
mkdir -p $inFolder/$highRES $inFolder/$lowRES $inFolder/$imgFld
###############################################################
if [[ $drySwitch == "dry" ]]; then
 dry=true
 echo "dry mode is on"
else
 dry=false
 echo "dry mode is off"
fi

###############################################################

numOfJpg=`ls -la $inFolder/*.JPG |wc -l`
numOfMp4=`ls -la $inFolder/*.MP4 |wc -l`
numOfLRF=`ls -la $inFolder/*.LRF |wc -l`

#listFiles by modfication date reverse order
for file in $folderList ; do

#File exists and is a directory ; skip;
if [ -d $inFolder/$file ] ; then
continue 
fi

	#split:
	filename=$(basename "$file")
	extension="${file##*.}"
	filename="${file%.*}"


### video
if [ $extension = "MP4" ] || [ $extension = "mp4" ]; then
echo "-------------------------------------------------------------------------------"
        echo -n $file 
        echo -n " ==> " 
        #file parts:    
        echo -n "[" $filename "]"
        echo -n "."
        echo -n "[" $extension "]"

	indexNum=$(($indexNum + 1 ))
	#indexNum PaddingFix:
        indexNumPad=`printf "%0*d" $padwidth $indexNum`
        #newName
        newFile=${prefix}_${indexNumPad}.${extension}
        echo -n "==>"
        echo -n $newFile

	if test -f "$inFolder/$filename.LRF"; then
		echo -n ";|found LRF for this MP4;"
		echo " "
		mvv $inFolder/$filename.LRF $inFolder/$lowRES/$newFile $dry
		mvv $inFolder/$file $inFolder/$highRES/$newFile $dry	
	else
		echo -n ";|NO LRF FILE FOUND;"
		echo " "
		cpp $inFolder/$file $inFolder/$lowRES/$newFile $dry
		mvv $inFolder/$file $inFolder/$highRES/$newFile $dry
		
	fi


fi



### photos
if [ $extension = "JPG" ] || [ $extension = "jpeg" ] || [ $extension = "jpg" ] ; then
echo "-------------------------------------------------------------------------------"
        echo -n $file 
        echo -n " ==> " 
	#file parts:    
        echo -n "[" $filename "]"
        echo -n "."
        echo -n "[" $extension "]"
	echo -n ";photo;"
	
	indexNum=$(($indexNum + 1 ))
	#indexNum PaddingFix:
        indexNumPad=`printf "%0*d" $padwidth $indexNum`
        #newName
        newFile=${prefix}_${indexNumPad}.${extension}
        echo -n "==>"
        echo -n $newFile
	echo " "

  	mvv $inFolder/$file $inFolder/$imgFld/$newFile $dry
fi

done


### summary
echo "-------------------------------------------------------------------------------"
echo "-------------------------------------------------------------------------------"
numOfJpg2=`ls -la $inFolder/$imgFld |wc -l`
numOfMp42=`ls -la $inFolder/$highRES |wc -l`
numOfLRF2=`ls -la $inFolder/$lowRES |wc -l`
echo "...jpg; before="  $numOfJpg " ; after=" $(expr $numOfJpg2 - 3)
echo "...mp4; before="  $numOfMp4 " ; after=" $(expr $numOfMp42 - 3)
echo "...lrf; before="  $numOfLRF " ; after=" $(expr $numOfLRF2 - 3)

## cleanup
if $dry ; then
echo "dry run wont delete `ls $inFolder/*.AAC`"
else
rm -rf $inFolder/*.AAC
rm -rf $inFolder/*.html
fi
