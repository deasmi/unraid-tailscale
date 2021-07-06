#!/bin/bash

VERSION=1.10.1
TSFILE=tailscale_${VERSION}_amd64.tgz
PACKAGE="https://pkgs.tailscale.com/stable/${TSFILE}"

echo "Downloading $PACKAGE"
wget  $PACKAGE >/dev/null 2>&1


echo "Unpacking"
DIR=$(mktemp -d -p .)

(cd $DIR ; tar xf ../${TSFILE} --strip-components=1 )

if [ -L latest ]; then
    rm latest
fi

ln -s $DIR latest

echo "Building"
docker build -t deasmi/unraid-tailscale:dev-$VERSION .

echo "Cleaning up"
rm -rf $DIR
rm latest
rm $TSFILE


