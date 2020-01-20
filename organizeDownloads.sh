#!/bin/bash

# Colors used for logs
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

#Check if argument specified
if [ $# -eq 0 ] 
then
    printf "${RED}Error: Please provide one directory${NC}\n"
    exit
fi
echo "Logged in as $USER"
baseDir="/Users/${USER}/${1}"
echo "Directory to organize is $baseDir"
currentDir=$(pwd)
echo "Current working directory $currentDir"
#Check if valid directory
if [ -d $baseDir ] 
then
    printf "${GREEN}Directory $baseDir exists.${NC}\n" 
else
    printf "${RED}Error: Directory $baseDir does not exists.${NC}\n"
fi