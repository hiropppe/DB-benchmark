### Setup Cluster

#### HBase Thrift server
```
root@master:/usr/local/hbase-2.0.1# bash ./bin/hbase-daemon.sh start thrift
```

#### Zookeeper for Kafka
Single keeper
```
$ sh ./zookeeper.sh
```

#### Kafka broker
```
root@bt4:/usr/local/kafka# bin/kafka-server-start.sh config/server.properties
```

#### Starting the cluster
```
# git clone http://192.168.88.180:18080/gitbucket/git/RD/frontera-clustered-crawler.git
# cd frontera-clustered-crawler
```

DB worker
```
root@bt1:~/frontera-clustered-crawler# python3 -m frontera.worker.db --config bc.config.dbw --no-incoming
```

Strategy worker
```
root@bt2:~/frontera-clustered-crawler# python3 -m frontera.worker.strategy --config bc.config.sw --partition-id 0
```

Spider
```
root@bt3:~/frontera-clustered-crawler# scrapy crawl bc -L INFO -s SEEDS_SOURCE='seeds.txt' -s SPIDER_PARTITION_ID=0 
```
