#!/bin/sh

# Start the Node.js application in the background
cd /apps/arrpc
node src &

cd /apps/NSO-RPC/client
python cli.py