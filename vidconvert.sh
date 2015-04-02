#!/usr/bin/bash

# Check if the user specified a directory
if [ $1 ]
then
    DIR=$1
else
    DIR=$(pwd)
fi

# change to that directory
cd $DIR

# if there's already a file named 'xbox360' in the directory, delete it
rm -rf xbox360

# create a directory to store the converted files
mkdir xbox360

# loop over all the files in the directory, convert them, and save
# the resulting file in the xbox360 directory
for f in *
do
    if ! [ -d "$f" ];
    then
	#echo "$f"
	ffmpeg -y -i "$f" -vcodec libx264 -acodec aac -b:a 92k -r 30 -strict -2 "xbox360/$f.mp4"
    fi
done
