#!/bin/ash

export PATH=$PATH:/usr/local/bin

set -e

if [ ! -d /dev/net ]; then
    mkdir -p /dev/net
fi
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

tailscaled --state=/state/tailscaled.state &

sleep 10

tailscale up

while true
do
    sleep 60
done
