#!/bin/bash
clear
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
/usr/bin/docker run -i -d -p 8001:8001 -p 22:22 -t drlinux/chicagoboss && echo "Container succesfully started... Please visit 127.0.0.1:8001"
