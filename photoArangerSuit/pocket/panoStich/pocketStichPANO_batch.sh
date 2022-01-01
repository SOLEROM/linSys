#!/bin/bash

###############################################################
### 			help
### assumptions:
###	- work in local folder
### inputs:
### $1 - rename folder prefix
### $2 - start index number
### 

folderPrefixName=$1
folderPrefixNum=$2

singleScript="./pocketStichPANO_single.sh"


rm -rf ./panos

##for each folder
for folder in `ls -tr $inFolder` ; do

mkdir -p ./panos

##rename to new name
	newName=$folderPrefixName"_"$folderPrefixNum
	echo $folder "reanme to" $newName 
	echo $folder "reanme to" $newName  >> ./panos/log
	mv $folder $newName

##run pano creator
	cd  $newName
	echo "run pano creator in" `pwd`
	"$singleScript"
	newPanoName=$newName".jpg"
	mv pano.jpg ../panos/$newPanoName
	cd ../
	
## next loop
        folderPrefixNum=$(($folderPrefixNum + 1 ))

done






