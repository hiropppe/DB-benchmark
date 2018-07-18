FROM hbase/base:2.0.1

# spark
RUN curl -s https://archive.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-without-hadoop.tgz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s spark-2.3.1-bin-without-hadoop spark

# spark hbase connector (apache)
# JavaHBaseBulkPutExample
# spark-submit --master yarn --deploy-mode cluster --files /usr/local/hbase/conf/hbase-site.xml --jars /usr/local/hbase/lib/hbase-client-2.0.1.jar,/usr/local/hbase/lib/hbase-server-2.0.1.jar,/usr/local/hbase/lib/hbase-common-2.0.1.jar,/usr/local/hbase/lib/hbase-protocol-2.0.1.jar,/usr/local/hbase/lib/hbase-protocol-shaded-2.0.1.jar,/usr/local/hbase/lib/hbase-mapreduce-2.0.1.jar,/usr/local/hbase/lib/hbase-it-2.0.1.jar,/tmp/hbase-shaded-miscellaneous-2.1.0.jar,/usr/local/hbase/lib/hbase-shaded-miscellaneous-2.1.0.jar,/usr/local/hbase/lib/hbase-shaded-netty-2.1.0.jar,/usr/local/hbase/lib/hbase-shaded-protobuf-2.1.0.jar,/usr/local/hbase/lib/protobuf-java-2.5.0.jar  --class org.apache.hadoop.hbase.spark.example.hbasecontext.JavaHBaseBulkPutExample hbase-spark/target/hbase-spark-3.0.0-SNAPSHOT.jar usertable family
RUN git clone --depth 1 https://github.com/apache/hbase.git \
 && cd hbase \
 && mvn install -DskipTests

# spark hbase connector (hortonworks)
RUN git clone --depth 1 https://github.com/hortonworks-spark/shc.git \
 && cd shc \
 && mvn install -DskipTests

# workaround
RUN mvn dependency:get -DgroupId=com.fasterxml.jackson.core -DartifactId=jackson-annotations -Dversion=2.9.0 \
 && mvn dependency:get -DgroupId=ch.qos.logback -DartifactId=logback-classic -Dversion=1.0.9 \
 && mvn dependency:get -DgroupId=ch.qos.logback -DartifactId=logback-core -Dversion=1.0.9 \
 && mvn dependency:get -DgroupId=org.apache.httpcomponents -DartifactId=httpcore -Dversion=4.1.3 \
 && mvn dependency:get -DgroupId=org.apache.hadoop -DartifactId=hadoop-common -Dversion=3.0.0 \
 && mvn dependency:get -DgroupId=org.apache.hadoop -DartifactId=hadoop-annotations -Dversion=3.0.0 \
 && mvn dependency:get -DgroupId=com.sun.jersey -DartifactId=jersey-core -Dversion=1.19 \
 && mvn dependency:get -DgroupId=javax.ws.rs -DartifactId=jsr311-api -Dversion=1.1.1 \
 && mvn dependency:get -DgroupId=com.sun.jersey -DartifactId=jersey-servlet -Dversion=1.19 \
 && mvn dependency:get -DgroupId=com.sun.jersey -DartifactId=jersey-json -Dversion=1.19 \
 && mvn dependency:get -DgroupId=javax.xml.bind -DartifactId=jaxb-api -Dversion=2.2.11 \
 && mvn dependency:get -DgroupId=org.codehaus.jackson -DartifactId=jackson-jaxrs -Dversion=1.9.2 \
 && mvn dependency:get -DgroupId=org.codehaus.jackson -DartifactId=jackson-xc -Dversion=1.9.2 \
 && mvn dependency:get -DgroupId=com.sun.jersey -DartifactId=jersey-server -Dversion=1.19 \
 && mvn dependency:get -DgroupId=commons-beanutils -DartifactId=commons-beanutils -Dversion=1.9.3 \
 && mvn dependency:get -DgroupId=org.apache.commons -DartifactId=commons-configuration2 -Dversion=2.1.1 \
 && mvn dependency:get -DgroupId=com.google.re2j -DartifactId=re2j -Dversion=1.1 \
 && mvn dependency:get -DgroupId=org.apache.hadoop -DartifactId=hadoop-auth -Dversion=3.0.0 \
 && mvn dependency:get -DgroupId=com.nimbusds -DartifactId=nimbus-jose-jwt -Dversion=4.41.1 \
 && mvn dependency:get -DgroupId=net.minidev -DartifactId=json-smart -Dversion=2.3 \
 && mvn dependency:get -DgroupId=net.minidev -DartifactId=accessors-smart -Dversion=1.2 \
 && mvn dependency:get -DgroupId=org.ow2.asm -DartifactId=asm -Dversion=5.0.4 \
 && mvn dependency:get -DgroupId=org.apache.curator -DartifactId=curator-framework -Dversion=2.12.0 \
 && mvn dependency:get -DgroupId=org.apache.curator -DartifactId=curator-client -Dversion=2.12.0 \
 && mvn dependency:get -DgroupId=org.apache.curator -DartifactId=curator-recipes -Dversion=2.12.0 \
 && mvn dependency:get -DgroupId=org.codehaus.woodstox -DartifactId=stax2-api -Dversion=3.1.4 \
 && mvn dependency:get -DgroupId=com.fasterxml.woodstox -DartifactId=woodstox-core -Dversion=5.0.3 \
 && mvn dependency:get -DgroupId=org.apache.hadoop -DartifactId=hadoop-mapreduce-client-core -Dversion=3.0.0 \
 && mvn dependency:get -DgroupId=org.apache.hadoop -DartifactId=hadoop-yarn-client -Dversion=3.0.0 \
 && mvn dependency:get -DgroupId=org.apache.hadoop -DartifactId=hadoop-yarn-api -Dversion=3.0.0 \
 && mvn dependency:get -DgroupId=org.apache.hadoop -DartifactId=hadoop-yarn-common -Dversion=3.0.0 \
 && mvn dependency:get -DgroupId=com.sun.jersey -DartifactId=jersey-client -Dversion=1.19 \
 && mvn dependency:get -DgroupId=com.google.inject.extensions -DartifactId=guice-servlet -Dversion=4.0 \
 && mvn dependency:get -DgroupId=com.google.inject -DartifactId=guice -Dversion=4.0 \
 && mvn dependency:get -DgroupId=com.sun.jersey.contribs -DartifactId=jersey-guice -Dversion=1.19 \
 && mvn dependency:get -DgroupId=com.fasterxml.jackson.module -DartifactId=jackson-module-jaxb-annotations -Dversion=2.7.8 \
 && mvn dependency:get -DgroupId=com.fasterxml.jackson.jaxrs -DartifactId=jackson-jaxrs-json-provider -Dversion=2.7.8 \
 && mvn dependency:get -DgroupId=com.fasterxml.jackson.jaxrs -DartifactId=jackson-jaxrs-base -Dversion=2.7.8 \
 && mvn dependency:get -DgroupId=org.apache.hadoop -DartifactId=hadoop-hdfs-client -Dversion=3.0.0 \
 && mvn dependency:get -DgroupId=com.squareup.okhttp -DartifactId=okhttp -Dversion=2.4.0 \
 && mvn dependency:get -DgroupId=com.squareup.okio -DartifactId=okio -Dversion=1.4.0 \
 && mvn dependency:get -DgroupId=io.netty -DartifactId=netty -Dversion=3.10.5.Final \
 && mvn dependency:get -DgroupId=com.clearspring.analytics -DartifactId=stream -Dversion=2.9.5 \
 && mvn dependency:get -DgroupId=it.unimi.dsi -DartifactId=fastutil -Dversion=7.0.6

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
