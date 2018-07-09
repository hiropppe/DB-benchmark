FROM ubuntu:16.04

RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list

ENV TZ Asia/Tokyo
RUN apt-get update \
  && apt-get install -y tzdata \
  && rm -rf /var/lib/apt/lists/* \
  && echo "${TZ}" > /etc/timezone \
  && rm /etc/localtime \
  && ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        build-essential \
        autotools-dev \
        automake \
        libtool \
        curl \
        wget \
        less \
        tree \
        vim \
        git \
        net-tools \
        iputils-ping \
        netcat \
        tcpdump \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python \
        python-dev \
        python-wheel \
        python-mock \
        python-pip \
        rsync \
        zip \
        unzip \
        g++ \
        gfortran \
        language-pack-ja-base \
        language-pack-ja \
        openssh-client \
        openssh-server \
        && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

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

RUN pip install -U pip
RUN pip install --no-cache-dir -U setuptools
RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        && \
        python -m ipykernel.kernelspec

# Install Java8
RUN add-apt-repository ppa:webupd8team/java && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get update && apt-get install -y oracle-java8-installer

# mvn
RUN curl -s http://ftp.riken.jp/net/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s ./apache-maven-* maven

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle \
    M2_HOME=/usr/local/maven

ENV PATH $PATH:$JAVA_HOME/bin:$M2_HOME/bin

RUN echo '# LANG' >> ~/.bashrc \
 && echo 'export LANG=ja_JP.UTF-8' >> ~/.bashrc \
 && echo '# JDK' >> ~/.bashrc \
 && echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc \
 && echo '# M2_HOME' >> ~/.bashrc \
 && echo "export M2_HOME=$M2_HOME" >> ~/.bashrc \
 && echo '' >> ~/.bashrc \
 && echo "export PATH=$PATH" >> ~/.bashrc

# Hadoop
RUN curl -s http://ftp.kddilabs.jp/infosystems/apache/hadoop/common/hadoop-2.8.4/hadoop-2.8.4.tar.gz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s ./hadoop-2.8.4/ hadoop \
 && mkdir -p /var/hadoop/dfs/data \
 && mkdir -p /var/hadoop/dfs/name

# Snappy
RUN curl --insecure -L -s https://github.com/google/snappy/releases/download/1.1.3/snappy-1.1.3.tar.gz | tar -xz -C . \
 && cd snappy-1.1.3 \
 && ./configure --enable-shared \
 && make \
 && make install \
 && cp /usr/local/lib/libsnappy.* /usr/local/hadoop/lib/native/

ENV HADOOP_HOME=/usr/local/hadoop \
    HADOOP_YARN_HOME=/usr/local/hadoop \
    HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-8-oracle\nHADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_HOME/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_HOME/etc/hadoop/hadoop-env.sh

RUN echo '# Hadoop' >> ~/.bashrc \
 && echo "export HADOOP_HOME=$HADOOP_HOME" >> ~/.bashrc \
 && echo 'export HADOOP_HDFS_HOME=$HADOOP_HOME' >> ~/.bashrc \
 && echo 'export HADOOP_MAPRED_HOME=$HADOOP_HOME' >> ~/.bashrc \
 && echo 'export HADOOP_YARN_HOME=$HADOOP_HOME' >> ~/.bashrc \
 && echo 'export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop' >> ~/.bashrc \
 && echo 'export YARN_CONF_DIR=$HADOOP_HOME/etc/hadoop' >> ~/.bashrc \
 && echo 'export HADOOP_PID_DIR=/var/hadoop/pids' >> ~/.bashrc

# HBase
RUN curl -s http://ftp.jaist.ac.jp/pub/apache/hbase/2.0.1/hbase-2.0.1-bin.tar.gz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s ./hbase-2.0.1/ hbase

ENV HBASE_HOME=/usr/local/hbase

RUN sed -i '/^# export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-8-oracle:' $HBASE_HOME/conf/hbase-env.sh
RUN sed -i '/^# export HBASE_MANAGES_ZK/ s:.*:export HBASE_MANAGES_ZK=false:' $HBASE_HOME/conf/hbase-env.sh
RUN echo "export HBASE_LIBRARY_PATH=$HADOOP_HOME/lib/native/" >> $HBASE_HOME/conf/hbase-env.sh

RUN echo '# HBase' >> ~/.bashrc \
 && echo "export HBASE_HOME=$HBASE_HOME" >> ~/.bashrc

RUN echo '# PATH' >> ~/.bashrc \
 && echo 'export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin:$HBASE_HOME/bin' >> ~/.bashrc
