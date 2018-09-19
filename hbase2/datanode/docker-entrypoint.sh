#!/bin/bash

set -e

# workaround for empty USER
USER=root

if [ -e "/tmp/*.pid" ]; then
    rm /tmp/*.pid
fi

if [ "$1" = 'start' ] && [ "$2" = 'datanode' ]; then
# Workaround. hdfs -daemon result in error, use hadoop-daemon.sh insteed.
# hdfs --daemon start datanode -config $HAOOP_CONF_DIR
# ERROR: Cannot set priority of namenode process 160
# [HADOOP-13632] Daemonization does not check process liveness before renicing
#     https://issues.apache.org/jira/browse/HADOOP-13632
    /etc/init.d/ssh start
    #set -- hadoop-daemon.sh --config $HADOOP_CONF_DIR "$@"
    #exec "$@"
    hadoop-daemon.sh --config $HADOOP_CONF_DIR start datanode
    while true; do sleep 1000; done
else
    exec "$@"
fi
