#!/bin/bash
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
clear

docker rm -f "cheri-cart" > /dev/null

/usr/bin/docker run -i -d --name=cheri-cart -p 8001:8001 -t "drlinux/chicagoboss" > /dev/null
CONTAINER_IP=$(/usr/bin/docker inspect --format="{{ .NetworkSettings.IPAddress }}" cheri-cart) 

echo "Chéri Chart started";

echo "Please visit : http://"$CONTAINER_IP":8001"


