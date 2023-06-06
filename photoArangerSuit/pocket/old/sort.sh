#!/bin/bash

folder=$1
echo "...will work at folder: " $folder

numOfJpg=`ls -la *.JPG |wc -l`
numOfMp4=`ls -la *.MP4 |wc -l`
numOfAAC=`ls -la *.AAC |wc -l`

echo "...remove all HTML files"
rm -rf $folder/*.html

echo "...create folders"
mkdir $folder/jpg
mkdir $folder/mp4

echo "...moving to folder"
mv $folder/*.JPG $folder/jpg
mv $folder/*.MP4 $folder/mp4
mv $folder/*.AAC $folder/mp4


numOfJpg2=`ls -la $folder/jpg |wc -l`
numOfMp42=`ls -la $folder/mp4 |wc -l`


echo "check file count:"
echo "...jpg; before="  $numOfJpg " ; after=" $(expr $numOfJpg2 - 3)
echo "...mp4; before="  $(expr $numOfMp4 + $numOfAAC) " ; after=" $(expr $numOfMp42 - 3)


