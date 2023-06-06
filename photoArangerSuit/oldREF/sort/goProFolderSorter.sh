#!/bin/bash

folder=$1
echo "input: will work at folder: " $folder

numOfJpg=`ls -la *.JPG |wc -l`
numOfMp4=`ls -la *.MP4 |wc -l`
numOfLrv=`ls -la *.LRV |wc -l`

echo "remove all THM files"
rm -rf $folder/*.THM

echo "create folders"
mkdir $folder/jpg
mkdir $folder/mp4
mkdir $folder/lrv

echo "moving to folder"
mv $folder/*.JPG $folder/jpg
mv $folder/*.MP4 $folder/mp4
mv $folder/*.LRV $folder/lrv


numOfJpg2=`ls -la $folder/jpg |wc -l`
numOfMp42=`ls -la $folder/mp4 |wc -l`
numOfLrv2=`ls -la $folder/lrv |wc -l`


echo "check file count:"
echo "...jpg; before="  $numOfJpg " ; after=" $numOfJpg2
echo "...mp4; before="  $numOfMp4 " ; after=" $numOfMp42
echo "...lrv; before="  $numOfLrv " ; after=" $numOfLrv2

