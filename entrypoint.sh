#!/bin/bash
set -e

if [ -z "$1" ]; then
    exec /usr/bin/salt-master
else
    exec "$@"
fi
