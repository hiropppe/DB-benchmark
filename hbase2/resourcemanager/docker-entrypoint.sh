#!/bin/bash

set -e

# workaround for empty USER
USER=root

if [ -e "/tmp/*.pid" ]; then
    rm /tmp/*.pid
fi

if [ "$1" = 'start' ]; then
    /etc/init.d/ssh start
    yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager
    while true; do sleep 1000; done
else
    exec "$@"
fi
