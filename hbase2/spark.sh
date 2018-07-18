#!/bin/bash
docker run -td --name spark --hostname spark --net host spark/hbase:2.3.1
