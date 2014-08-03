#!/bin/bash
clear
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
if [[$( /usr/bin/docker rm cheri-cart)]]; then echo "Old container removed"; fi
echo "Building docker image... Please be patient... This may take some time..."

/usr/bin/docker build -t drlinux/chicagoboss .

curl -o insecure_key -fSL https://github.com/phusion/baseimage-docker/raw/master/image/insecure_key

chmod 600 insecure_key

echo "Runing the container"

/usr/bin/docker run -d -i --name="cheri-cart" -t drlinux/chicagoboss

echo "Cloning project files to ~/development/chericart directory..."

/usr/bin/docker cp cheri-cart:/source/chericart ~/development

/usr/bin/docker stop cheri-cart

chown -R $USER:$USER  ~/development/chericart/

echo "Please type to run contanier : "

echo " ./run.sh"
