#!/bin/ash

export PATH=$PATH:/usr/local/bin

set -e

if [ ! -d /dev/net ]; then
    mkdir -p /dev/net
fi
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

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

