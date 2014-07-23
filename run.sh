#!/bin/bash
clear
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
/usr/bin/docker run -i -p 8001 -v ~/development/richercart:/source/richercart -t drlinux/chicagoboss /bin/bash
