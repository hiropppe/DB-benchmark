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
        && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN pip install -U pip
RUN pip install --no-cache-dir -U setuptools
RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        pymongo \
        jsonschema \
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

RUN git clone https://github.com/brianfrankcooper/YCSB.git \
 && cd YCSB \
 && mvn -pl com.yahoo.ycsb:mongodb-binding -am clean package
