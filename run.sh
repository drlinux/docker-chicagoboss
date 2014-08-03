#!/bin/bash
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
clear

docker rm -f "cheri-cart" > /dev/null

#/usr/bin/docker run -i -d -v ~/development/chericart:/source/chericart --name=cheri-cart -p 8001:8001 -t "drlinux/chicagoboss" > /dev/null
/usr/bin/docker run -i -d -v ~/development/chericart:/source/chericart:rw --name=cheri-cart -p 8001:8001 -t "drlinux/chicagoboss" > /dev/null

CONTAINER_IP=$(/usr/bin/docker inspect --format="{{ .NetworkSettings.IPAddress }}" cheri-cart) 

echo "Congrats! Chéri Chart started";

echo "Please visit : http://"$CONTAINER_IP":8001"

echo "You can access the source files by type :"

echo "cd ~/development/chericart/"
