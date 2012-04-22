#!/bin/sh
# Created By Nate Ober
# Nate [dot] Ober [at] Gmail

INTERFACE=`route -n get default | awk /interface:/'{print $2}'`;
EXTERNALIP=`dig +short myip.opendns.com @resolver1.opendns.com`;
INTERNALIP=`ifconfig $INTERFACE | awk /inet\ /'{print $2}'`;
MACADDRESS=`ifconfig $INTERFACE | awk /ether\ /'{print $2}'`;


echo "External IP: $EXTERNALIP"
echo "Internal IP: $INTERNALIP"
echo "Mac Address: $MACADDRESS"