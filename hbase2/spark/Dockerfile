FROM hbase/base:2.0.1

# spark
RUN curl -s https://archive.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-without-hadoop.tgz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s spark-2.3.1-bin-without-hadoop spark

# spark-hbase-connector
RUN git clone https://github.com/hortonworks-spark/shc.git \
 && cd shc \
 && mvn package -DskipTests

ENV SPARK_HOME=/usr/local/spark

RUN echo '# Spark' >> ~/.bashrc \
 && echo "export SPARK_HOME=$SPARK_HOME" >> ~/.bashrc

RUN echo '# PATH' >> ~/.bashrc \
 && echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bashrc

COPY core-site.xml $HADOOP_HOME/etc/hadoop/
COPY yarn-site.xml $HADOOP_HOME/etc/hadoop/
COPY hbase-site.xml $HBASE_HOME/conf/

WORKDIR $SPARK_HOME
