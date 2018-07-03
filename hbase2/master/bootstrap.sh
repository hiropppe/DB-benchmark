#!/bin/bash
 
# workaround for empty USER
USER=root
 
rm /tmp/*.pid
 
# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# altering the core-site configuration
sed s/NAMENODE/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml
sed s/NAMENODE/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/hdfs-site.xml.template > /usr/local/hadoop/etc/hadoop/hdfs-site.xml
sed s/RESOURCEMANAGER/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/yarn-site.xml.template > /usr/local/hadoop/etc/hadoop/yarn-site.xml
 
/etc/init.d/ssh start
 
$HADOOP_PREFIX/bin/hdfs namenode -format ycsb
$HADOOP_PREFIX/sbin/hadoop-daemon.sh --config $HADOOP_CONF_DIR --script hdfs start namenode
$HADOOP_YARN_HOME/sbin/yarn-daemon.sh --config $HADOOP_CONF_DIR start resourcemanager

if [[ $1 == "-d" ]]; then
  tail -f /dev/null
fi
 
if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
