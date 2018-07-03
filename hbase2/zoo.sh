#!/bin/bash

if [ $# = 0 ]; then
    docker run --name zoo --hostname zoo --restart always -d --net host zookeeper
else
    ZOO_SERVERS="server.1="$([ "$2" == 1 ] && echo "0.0.0.0" || echo "zoo1")":2888:3888"
    for i in `seq 2 1 ${1}`;
    do
        ZOO_SERVERS=$ZOO_SERVERS" server."$i"="$([ $2 == ${i} ] && echo '0.0.0.0' || echo 'zoo'${i})":2888:3888";
    done
    echo "docker run --name zoo$2 --hostname zoo$2 --restart always -d --net host -e ZOO_MY_ID="$2" -e ZOO_SERVERS="$ZOO_SERVERS" zookeeper"
    docker run --name zoo$2 --hostname zoo$2 --restart always -d --net host -e ZOO_MY_ID="$2" -e ZOO_SERVERS="$ZOO_SERVERS" zookeeper
fi

