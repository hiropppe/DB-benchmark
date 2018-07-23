## Cluster Setup

### Run shard server (rs0, rs1, rs2)
```
# Example for 1st shard server (node0)
$ docker-compose -f shardsvr0.yml up -d
```

### Run router (mongos) with config server (mongoc)
```
$ docker-compose -f router.yml up -d
```

### Initialize replicaSet
ReplicaSet 0
```
> config = {_id: 'rs0',
     members: [
       {_id: 0, host: '<1st shard server ip>:27018'},
       {_id: 1, host: '<4th shard server ip>:27018', priority: 0.5}
     ]
   }
>rs.initiate(config)
```

ReplicaSet 1
```
> config = {_id: 'rs1',
     members: [
       {_id: 0, host: '<2nd shard server ip>:27028'},
       {_id: 1, host: '<1st shard server ip>:27028', priority: 0.5}
     ]
   }
> rs.initiate(config)
```

ReplicaSet 2
```
> config = {_id: 'rs2',
     members: [
       {_id: 0, host: '<3rd shard server ip>:27038'},
       {_id: 1, host: '<2nd shard server ip>:27038', priority: 0.5}
     ]
   }
> rs.initiate(config)
```

Config
```
> config = {_id: 'rsconf',
     members: [
       {_id: 0, host: '<config server ip>:27019'},
     ]
   }
> rs.initiate(config)
```

### Setup sharding
```
mongos> sh.addShard( "rs0/<1st shard server ip>:27018")
mongos> sh.addShard( "rs1/<2nd shard server ip>:27028")
mongos> sh.addShard( "rs2/<3rd shard server ip>:27038")
mongos> sh.enableSharding("ycsb")
mongos> sh.shardCollection("ycsb.usertable", { _id : 1 } )
```

## Benchmark
```
# ./bin/ycsb load mongodb -P workloads/workloada -p mongodb.url=mongodb://<router server id>:27017/ycsb?w=0 -s
# ./bin/ycsb run mongodb -P workloads/workloada -p mongodb.url=mongodb://<router server id>:27017/ycsb?w=0 -s
```
