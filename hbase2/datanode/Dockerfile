FROM hadoop/common:3.0.3

# allow empty password root ssh
RUN echo "Port 2122" >> /etc/ssh/sshd_config \
 && sed -ri 's/^PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config \
 && passwd -d root

# ssh without host key cheking
RUN mkdir -p ~/.ssh \
 && echo "Host *" > ~/.ssh/config \
 && echo " Port 2122" >> ~/.ssh/config \
 && echo " StrictHostKeyChecking no" >> ~/.ssh/config

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
