FROM hbase/common:2.0.2

COPY hbase-site.xml $HBASE_HOME/conf/
COPY hbase-site.xml $PHOENIX_HOME/bin/

COPY docker-entrypoint.sh /
RUN chown root:root /docker-entrypoint.sh && chmod 700 /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/bin/bash"]
