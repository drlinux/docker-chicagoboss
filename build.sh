#!/bin/bash
clear
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
echo "Building docker image... Please be patient... This may take some time..."
/usr/bin/docker build -t drlinux/chicagoboss .
curl -o insecure_key -fSL https://github.com/phusion/baseimage-docker/raw/master/image/insecure_key
chmod 600 insecure_key
