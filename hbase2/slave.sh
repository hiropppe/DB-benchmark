#!/bin/bash

docker run -td --name slave${1} --hostname slave${1} --net host hbase2/slave:latest
