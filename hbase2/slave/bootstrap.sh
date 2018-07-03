#!/bin/bash
 
# workaround for empty USER
USER=root
 
rm /tmp/*.pid
 
# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

/etc/init.d/ssh restart

# altering the configurations
sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/yarn-site.xml.template > /usr/local/hadoop/etc/hadoop/yarn-site.xml
 
# start daemons
$HADOOP_PREFIX/sbin/hadoop-daemons.sh --config $HADOOP_CONF_DIR --script hdfs start datanode
$HADOOP_YARN_HOME/sbin/yarn-daemons.sh --config $HADOOP_CONF_DIR start nodemanager

if [[ $1 == "-d" ]]; then
  tail -f /dev/null
fi
 
if [[ $1 == "-bash" ]]; then
  /bin/bash
fi
