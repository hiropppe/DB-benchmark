FROM hbase/base:2.0.1

# spark
RUN curl -s https://archive.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-without-hadoop.tgz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s spark-2.3.1-bin-without-hadoop spark

# spark hbase connector (apache)
# JavaHBaseBulkPutExample
# spark-submit --master yarn --deploy-mode cluster --files /usr/local/hbase/conf/hbase-site.xml --jars /usr/local/hbase/lib/hbase-client-2.0.1.jar,/usr/local/hbase/lib/hbase-server-2.0.1.jar,/usr/local/hbase/lib/hbase-common-2.0.1.jar,/usr/local/hbase/lib/hbase-protocol-2.0.1.jar,/usr/local/hbase/lib/hbase-protocol-shaded-2.0.1.jar,/usr/local/hbase/lib/hbase-mapreduce-2.0.1.jar,/usr/local/hbase/lib/hbase-it-2.0.1.jar,/tmp/hbase-shaded-miscellaneous-2.1.0.jar,/usr/local/hbase/lib/hbase-shaded-miscellaneous-2.1.0.jar,/usr/local/hbase/lib/hbase-shaded-netty-2.1.0.jar,/usr/local/hbase/lib/hbase-shaded-protobuf-2.1.0.jar,/usr/local/hbase/lib/protobuf-java-2.5.0.jar  --class org.apache.hadoop.hbase.spark.example.hbasecontext.JavaHBaseBulkPutExample hbase-spark/target/hbase-spark-3.0.0-SNAPSHOT.jar usertable family
RUN git clone https://github.com/apache/hbase.git \
 && cd hbase \
 && mvn package -DskipTests

# spark hbase connector (hortonworks)
RUN git clone https://github.com/hortonworks-spark/shc.git \
 && cd shc \
 && mvn package -DskipTests

ENV SPARK_HOME=/usr/local/spark

RUN echo '# Spark' >> ~/.bashrc \
 && echo "export SPARK_HOME=$SPARK_HOME" >> ~/.bashrc \
 && echo 'export SPARK_DIST_CLASSPATH=$(hadoop classpath)' >> ~/.bashrc

RUN echo '# PATH' >> ~/.bashrc \
 && echo 'export PATH=$PATH:$SPARK_HOME/bin' >> ~/.bashrc

COPY core-site.xml $HADOOP_HOME/etc/hadoop/
COPY yarn-site.xml $HADOOP_HOME/etc/hadoop/
COPY hbase-site.xml $HBASE_HOME/conf/

WORKDIR $SPARK_HOME
