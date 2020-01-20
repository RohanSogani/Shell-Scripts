#!/bin/bash

echo "Logged in as $USER"
pathToClean='/Users/${USER}'
echo "$pathToClean"
if [ $# -eq 0 ] 
then
    echo "Please provide one directory"
    exit
fi

echo "Arg 1: $1"