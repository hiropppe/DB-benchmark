#!/bin/bash

docker run -td --name master --hostname master --net host hbase/master:2.0.1
