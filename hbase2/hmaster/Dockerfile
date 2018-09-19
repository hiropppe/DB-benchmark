FROM hbase/core:2.0.1

COPY hbase-env.sh $HBASE_HOME/conf/
COPY hbase-site.xml $HBASE_HOME/conf/
COPY regionservers $HBASE_HOME/conf/
COPY backup-masters $HBASE_HOME/conf/

ENV PATH $PATH:$HBASE_HOME/bin

COPY docker-entrypoint.sh /
RUN chown root:root /docker-entrypoint.sh && chmod 700 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/bash"]

# ssh
EXPOSE 2122
# hmaster
EXPOSE 16000
