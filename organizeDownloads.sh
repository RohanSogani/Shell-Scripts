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
echo "Arg 1: $1"
echo "Logged in as $USER"
pathToClean="/Users/${USER}/${1}"
echo "Directory to organize is $pathToClean"

#Check if valid directory
if [ -d $pathToClean ] 
then
    printf "${GREEN}Directory $pathToClean exists.${NC}\n" 
else
    printf "${RED}Error: Directory $pathToClean does not exists.${NC}\n"
fi