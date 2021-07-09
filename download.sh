#!/bin/bash

VERSION=1.8.8
TSFILE=tailscale_${VERSION}_amd64.tgz
PACKAGE="https://pkgs.tailscale.com/stable/${TSFILE}"

echo "Downloading $PACKAGE"
wget  $PACKAGE >/dev/null 2>&1

if (($?!=200))  
then 
	echo >2 "Could not download file ${TSFILE}"
	exit 1 
fi

echo "Unpacking"
DIR=$(mktemp -d -p .)

(cd $DIR ; tar vxf ../${TSFILE} --strip-components=1 )

ln -s $DIR latest

echo $(pwd)



