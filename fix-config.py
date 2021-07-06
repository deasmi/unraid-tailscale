#!/usr/bin/env python3

import json
import sys
import base64


if (len(sys.argv)<2):
    print("Please supply filename to fix.")
    exit()


file = sys.argv[1]

with open(file, "r") as read_file:
    data = json.load(read_file)

# The _daemon key is a base64 encoded JSON string
daemon = json.loads(base64.b64decode(data['_daemon']))
# We remove the ControlURL key
daemon.pop('ControlURL',None)
# And put it back


daemon_bytes=json.dumps(daemon).encode('ascii')
base64_bytes=base64.b64encode(daemon_bytes)
data['_daemon']=base64_bytes.decode('ascii')

print(json.dumps(data))

