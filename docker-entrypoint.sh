#!/bin/ash

export PATH=$PATH:/usr/local/bin

set -e

if [ ! -d /dev/net ]; then
    mkdir -p /dev/net
fi
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

TSFILE=tailscale_latest_amd64.tgz
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

# Start the daemon
/app/tailscaled --state=/state/tailscaled.state --statedir=/state/ &

# Let it get connected to the control plane
sleep 10

# Start the interface
/app/tailscale up ${UP_FLAGS:-}

# Start downloads if enabled
if [ "${ENABLE_DOWNLOADS}" = "TRUE" ]; then
    echo "Enabling downloads"
    /app/tailscale file get -wait=true -conflict=rename -loop=true /downloads &
fi


# Do nothing until the end of time
sleep infinity
