FROM hbase/base:2.0.1

COPY hadoop-env.sh $HADOOP_HOME/etc/hadoop/
COPY core-site.xml $HADOOP_HOME/etc/hadoop/
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY mapred-site.xml $HADOOP_HOME/etc/hadoop/
COPY yarn-site.xml $HADOOP_HOME/etc/hadoop/

COPY hbase-env.sh $HBASE_HOME/conf/
COPY hbase-site.xml $HBASE_HOME/conf/
COPY regionservers $HBASE_HOME/conf/
COPY backup-masters $HBASE_HOME/conf/

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh && chmod 700 /etc/bootstrap.sh
ENV BOOTSTRAP /etc/bootstrap.sh

WORKDIR $HBASE_HOME

CMD ["/etc/bootstrap.sh", "-d"]

# ssh
EXPOSE 2122
# namenode
EXPOSE 9000
# hmaster
EXPOSE 16000
# yarn resource manager
EXPOSE 8030 8031 8032 8033
