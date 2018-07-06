#!/bin/bash

docker run -td --name slave${1} --hostname slave${1} --net host hbase/slave:2.0.1
