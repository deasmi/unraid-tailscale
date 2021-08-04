#!/bin/bash

# VERSION SHOULD BE IN ENV
TSFILE=tailscale_${VERSION}_amd64.tgz
PACKAGE="https://pkgs.tailscale.com/stable/${TSFILE}"

echo "Downloading $PACKAGE"
wget  $PACKAGE >/dev/null 2>&1

ret=$?

if [ $ret -ne 0 ]; then
	echo "Failed to download release"
	exit 1;
fi

echo "Unpacking"
DIR=$(mktemp -d -p .)

(cd $DIR ; tar vxf ../${TSFILE} --strip-components=1 )

ln -s $DIR latest

echo $(pwd)



