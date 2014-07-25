#!/bin/bash
clear
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
echo "Building docker image... Please be patient... This will take some time..."
/usr/bin/docker build -t drlinux/chicagoboss .
