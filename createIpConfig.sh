#!/bin/bash
#Check if docker command exists
if ! hash docker 2> /dev/null; then
  echo "Docker command not found. Please install Docker"
  exit 1
fi

file="ifconfig.txt"

if [ -f $file ] ; then
    echo "File Exists... Deleting File"
    rm $file
    echo "Deleted"
fi

#Command to get just the names of all the servers setup in docker
OUTPUT="$(docker ps --format '{{.Names}}' | sort)"
#echo "${OUTPUT}"
IPC=""
echo "Server sequence --> IP"
for server in ${OUTPUT};
do
  #Get just the IP Address of all the servers
  #echo "$server"
  if [ $server = "c1" ]
  then
    echo "Client found skip for now"
    IPC="$(docker inspect $server | grep -Po '"IPAddress": *\K"([0-9]{1,3}[\.]){3}[0-9]{1,3}"')"
    IPC="${IPC%\"}"
    IPC="${IPC#\"}"
    echo "$server --> ${IPC}"
  else
    IP="$(docker inspect $server | grep -Po '"IPAddress": *\K"([0-9]{1,3}[\.]){3}[0-9]{1,3}"')"
    #Remove quotes
    IP="${IP%\"}"
    IP="${IP#\"}"
    echo "$server --> ${IP}"
    #Append in ifconfig,txt
    echo "${IP}" >> $file
  fi
done
echo "Put Client IP at the bottom"
echo $IPC >> $file
echo "$file Created!"

