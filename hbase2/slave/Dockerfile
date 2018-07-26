FROM hbase/base:2.0.1

COPY hadoop-env.sh $HADOOP_HOME/etc/hadoop/
COPY core-site.xml $HADOOP_HOME/etc/hadoop/
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY mapred-site.xml $HADOOP_HOME/etc/hadoop/
COPY yarn-site.xml.template $HADOOP_HOME/etc/hadoop/

COPY hbase-env.sh $HBASE_HOME/conf/
COPY hbase-site.xml $HBASE_HOME/conf/

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh && chmod 700 /etc/bootstrap.sh
ENV BOOTSTRAP /etc/bootstrap.sh

WORKDIR $HBASE_HOME

CMD ["/etc/bootstrap.sh", "-d"]

# ssh
EXPOSE 2122
# datanode
EXPOSE 9864 9865 9866 9867
# hmaster (backup)
EXPOSE 16000
# region server
EXPOSE 16020 16030
# node manager
EXPOSE 8040 8042
# node manager ?
EXPOSE 13562 45059
