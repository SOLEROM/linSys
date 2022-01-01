#!/bin/bash
#======================================================##
##ref:
## https://wiki.panotools.org/Panorama_scripting_in_a_nutshell#Creating_hugin_projects_on_the_command-line
##install
## sudo add-apt-repository ppa:ubuntuhandbook1/apps
## sudo apt update
## sudo apt install hugin
##=====================================================##



#Generating the project file
pto_gen -o project.pto *.JPG
#Generating control points
cpfind --multirow -o project.pto project.pto
#Pruning control points
celeste_standalone -i project.pto -o project.pto
cpclean -o project.pto project.pto
#Find vertical lines 
linefind -o project.pto project.pto
#Optimising positions and geometry
autooptimiser -a -l -s -m -o project.pto project.pto
#Setting output options / Calculate optimal crop and optimal size 
pano_modify -o project.pto --center --straighten --canvas=AUTO --crop=AUTO project.pto
#Remapping (Rendering) images
nona -m TIFF_m -o project project.pto
#Blending
enblend -o pano.tif project*.tif
#convert
convert pano.tif pano.jpg
#cleanUP
rm project*.tif pano.tif 


