FROM hbase/common:2.0.2

# allow empty password root ssh
RUN echo "Port 2322" >> /etc/ssh/sshd_config \
 && sed -ri 's/^PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config \
 && passwd -d root

# ssh without host key cheking
RUN mkdir -p ~/.ssh \
 && echo "Host *" > ~/.ssh/config \
 && echo " Port 2322" >> ~/.ssh/config \
 && echo " StrictHostKeyChecking no" >> ~/.ssh/config

COPY hbase-env.sh $HBASE_HOME/conf/
COPY hbase-site.xml $HBASE_HOME/conf/
COPY regionservers $HBASE_HOME/conf/

ENV PATH $PATH:$HBASE_HOME/bin

COPY docker-entrypoint.sh /
RUN chown root:root /docker-entrypoint.sh && chmod 700 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/bash"]

# ssh
EXPOSE 2322
# hmaster
EXPOSE 16000
