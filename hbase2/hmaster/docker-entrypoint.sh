#!/bin/bash

set -e

# workaround for empty USER
USER=root

if [ -e "/tmp/*.pid" ]; then
    rm /tmp/*.pid
fi

if [ "$1" = 'start' ]; then
    /etc/init.d/ssh start
    # hbase-daemon.sh start master
    while true; do sleep 1000; done
else
    exec "$@"
fi
