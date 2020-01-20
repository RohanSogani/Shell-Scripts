#!/bin/bash
#!/usr/bin/env

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

#Hardcode file types in variables as Directory names 
PDFs="$baseDir/*.pdf" 
DMGs="$baseDir/*.dmg" 
PPTs="$baseDir/*.pptx $baseDir/*.ppt $baseDir/*.pps" 
DOCs="$baseDir/*.doc $baseDir/*.docx $baseDir/*.txt $baseDir/*.tex" 
IMGs="$baseDir/*.png $baseDir/*.jpeg" 
XLXs="$baseDir/*.csv $baseDir/*.xlr $baseDir/*.xls $baseDir/*.xlsx" 
VIDs="$baseDir/*.wmv $baseDir/*.mp4 $baseDir/*.mov $baseDir/*.mpeg" 
ARCHIVESs="$baseDir/*.tar $baseDir/*.pkg $baseDir/*.tar.gz $baseDir/*.zip" 
CODEs="$baseDir/*.c $baseDir/*.cpp $baseDir/*.sh $baseDir/*.py"
#End of Directories

#Organize --> Algo 1
declare -a dirArrays=("PDFs" "DMGs" "PPTs" "DOCs" "IMGs" "XLXs" "VIDs" "ARCHIVESs" "CODEs")
for i in "${dirArrays[@]}"
do
    #-p to create only if not available
	mkdir -p $baseDir/$i
    #2>/dev/null to make mv silent in case an above file type not found
    mv -f ${!i} $baseDir/$i/ 2>/dev/null
done



