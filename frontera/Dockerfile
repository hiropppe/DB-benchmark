FROM ubuntu:16.04
 
RUN mkdir /root/_INSTALL
 
WORKDIR /root/_INSTALL
 
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
        python3 \
        python3-dev \
        python3-wheel \
        python3-mock \
        python3-pip \
        python3-mysqldb \
        rsync \
        zip \
        unzip \
        g++ \
        gfortran \
        language-pack-ja-base \
        language-pack-ja 

# Install Java8
RUN add-apt-repository ppa:webupd8team/java && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get update && apt-get install -y oracle-java8-installer

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle

ENV PATH $PATH:$JAVA_HOME/bin

RUN echo '# JDK' >> ~/.bashrc \
 && echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc \
 && echo '' >> ~/.bashrc \
 && echo "export PATH=$PATH" >> ~/.bashrc \
 && echo '' >> ~/.bashrc 

# Install Scala
RUN wget https://downloads.lightbend.com/scala/2.11.12/scala-2.11.12.deb \
 && dpkg -i scala-2.11.12.deb

RUN curl -s http://ftp.meisei-u.ac.jp/mirror/apache/dist/kafka/1.1.1/kafka_2.11-1.1.1.tgz | tar -xz -C /usr/local/ \
 && cd /usr/local \
 && ln -s kafka_2.11-1.1.1/ kafka

RUN pip3 install -U pip
RUN pip3 install --no-cache-dir -U setuptools
RUN pip3 --no-cache-dir install \
        ipykernel \
        jupyter \
        Scrapy==1.5.1 \
        frontera[distributed,zeromq,sql,hbase]==0.7.1 \
        jedi \
        flake8 \
        autopep8 \
        && \
        python3 -m ipykernel.kernelspec

RUN echo '# LANG' >> ~/.bashrc \
 && echo 'export LANG=ja_JP.UTF-8' >> ~/.bashrc
 
WORKDIR /root
