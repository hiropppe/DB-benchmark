#!/bin/bash

docker run -td --name master --hostname master --net host hbase2/master:latest
