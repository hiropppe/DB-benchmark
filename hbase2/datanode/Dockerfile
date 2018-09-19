FROM hbase/core:2.0.1

COPY hadoop-env.sh $HADOOP_HOME/etc/hadoop/
COPY core-site.xml $HADOOP_HOME/etc/hadoop/
COPY hdfs-site.xml $HADOOP_HOME/etc/hadoop/
COPY mapred-site.xml $HADOOP_HOME/etc/hadoop/

ENV PATH $PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

COPY docker-entrypoint.sh /
RUN chown root:root /docker-entrypoint.sh && chmod 700 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/bash"]

# ssh
EXPOSE 2122
# datanode
EXPOSE 9864 9865 9866 9867
# hmaster (backup)
#EXPOSE 16000
# region server
#EXPOSE 16020 16030
# node manager
#EXPOSE 8040 8042
# node manager ?
#EXPOSE 13562 45059
