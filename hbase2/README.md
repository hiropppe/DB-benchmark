test memo

#### Run NameNode
```
$ sh ./master.sh
```

#### Run DataNode
```
$ sh ./slave.sh <slave_id>
```

#### Run Zookeeper
Single server
```
$ sh ./zoo.sh
```
Ensemble
```
$ sh ./zoo.sh <#servers> <my_id>
```

#### Start HBase cluster
```
$ docker exec -it master /bin/bash
```
```
root@master:/usr/local/hbase-2.0.1# bash ./bin/start-hbase.sh
```

#### Create a HBase table for testing
```
root@master:/usr/local/hbase-2.0.1# hbase shell
hbase(main):003:0> n_splits = 300
hbase(main):003:0> create 'usertable', 'family', {SPLITS => (1..n_splits).map {|i| "user#{1000+i*(9999-1000)/n_splits}"}}
```

## YCSB
```
# ./bin/ycsb load hbase20 -P workloads/workloada -cp ./conf -p table=usertable -p columnfamily=family -s
# ./bin/ycsb run hbase20 -P workloads/workloada -cp ./conf -p table=usertable -p columnfamily=family -s
```
