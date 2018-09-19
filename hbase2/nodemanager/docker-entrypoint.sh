#!/bin/bash

set -e

# workaround for empty USER
USER=root

if [ -e "/tmp/*.pid" ]; then
    rm /tmp/*.pid
fi

# altering the configurations
sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/yarn-site.xml.template > /usr/local/hadoop/etc/hadoop/yarn-site.xml

if [ "$1" = 'start' ]; then
    /etc/init.d/ssh start
    yarn-daemon.sh --config $HADOOP_CONF_DIR start nodemanager
    while true; do sleep 1000; done
else
    exec "$@"
fi
