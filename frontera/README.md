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

#### Create all topics needed for Kafka message bus
```
root@bt4:/usr/local/kafka# bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic frontier-done
root@bt4:/usr/local/kafka# bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic frontier-todo
root@bt4:/usr/local/kafka# bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic frontier-score

```

#### Starting the cluster
```
# git clone http://192.168.88.180:18080/gitbucket/git/RD/frontera-clustered-crawler.git
# cd frontera-clustered-crawler
```

DB worker
```
root@bt1:~/frontera-clustered-crawler# python3 -m frontera.worker.db --config bc.config.dbw --partitions 0
```

Strategy worker
```
root@bt2:~/frontera-clustered-crawler# python3 -m frontera.worker.strategy --config bc.config.sw --partition-id 0
```

Spider
```
root@bt3: python3 -m frontera.utils.add_seeds --config bc.config.dbw --seeds-file seeds.txt
root@bt3:~/frontera-clustered-crawler# scrapy crawl bc -L INFO -s SPIDER_PARTITION_ID=0 
```
