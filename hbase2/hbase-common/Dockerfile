FROM hadoop/common:3.0.3

# HBase
RUN curl -s http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/hbase/2.0.2/hbase-2.0.2-bin.tar.gz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s ./hbase-2.0.2/ hbase

ENV HBASE_HOME=/usr/local/hbase

RUN echo '# HBase' >> ~/.bashrc \
 && echo "export HBASE_HOME=$HBASE_HOME" >> ~/.bashrc

RUN echo '# PATH' >> ~/.bashrc \
 && echo 'export PATH=$PATH:$HBASE_HOME/bin' >> ~/.bashrc

# Phoenix
RUN curl -s http://ftp.riken.jp/net/apache/phoenix/apache-phoenix-5.0.0-HBase-2.0/bin/apache-phoenix-5.0.0-HBase-2.0-bin.tar.gz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s ./apache-phoenix-5.0.0-HBase-2.0-bin/ phoenix \
 && cd phoenix \
 && cp phoenix-core-5.0.0-HBase-2.0.jar ../hbase/lib/ \
 && cp phoenix-5.0.0-HBase-2.0-server.jar ../hbase/lib/

ENV PHOENIX_HOME=/usr/local/phoenix

RUN echo '# Phoenix' >> ~/.bashrc \
 && echo "export PHOENIX_HOME=$PHOENIX_HOME" >> ~/.bashrc

RUN echo '# PATH' >> ~/.bashrc \
 && echo 'export PATH=$PATH:$PHOENIX_HOME/bin' >> ~/.bashrc
