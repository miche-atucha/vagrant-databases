#!/bin/bash

echo "IP: 1.1.1.1"

echo "Testing MongoDB..."
mongo --eval 'db.runCommand({ connectionStatus: 1 })'
