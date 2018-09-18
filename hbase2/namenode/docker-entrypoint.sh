#!/bin/bash
 
# workaround for empty USER
USER=root
 
rm /tmp/*.pid
 
# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_HOME/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

/etc/init.d/ssh start
 
$HADOOP_HOME/bin/hdfs namenode -format
#$HADOOP_HOME/bin/hdfs namenode
#$HADOOP_HOME/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR start namenode
