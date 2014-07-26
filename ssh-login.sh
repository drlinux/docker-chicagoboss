#!/bin/bash
if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi
ssh -i insecure_key root@$(docker inspect --format="{{ .NetworkSettings.IPAddress }}" cheri-cart)
