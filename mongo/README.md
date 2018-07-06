test memo

#### Run mongod (rs0, rs1, rs2)
```
$ docker-compose -f mongod.yml up -d
```

#### Run mongoc
```
$ docker-compose -f mongoc.yml up -d
```

#### Run mongos
```
$ docker-compose -f mongos.yml up -d
```

#### ReplicaSet 0
```
> config = {_id: 'rs0',
     members: [
       {_id: 0, host: '<1st mongod ip>:27018'},
       {_id: 1, host: '<2nd mongod ip>:27018'},
       {_id: 2, host: '<3rd mongod ip>:27018'}
     ]
   }
>rs.initiate(config)
```

#### ReplicaSet 1
```
> config = {_id: 'rs1',
     members: [
       {_id: 0, host: '<1st mongod ip>:27028'},
       {_id: 1, host: '<2nd mongod ip>:27028'},
       {_id: 2, host: '<3rd mongod ip>:27028'}
     ]
   }
> rs.initiate(config)
```

#### ReplicaSet 2
```
> config = {_id: 'rs2',
     members: [
       {_id: 0, host: '<1st mongod ip>:27038'},
       {_id: 1, host: '<2nd mongod ip>:27038'},
       {_id: 2, host: '<3rd mongod ip>:27038'}
     ]
   }
> rs.initiate(config)
```

#### Config server
```
> config = {_id: 'rsconf',
     members: [
       {_id: 0, host: '<mongoc ip>:27019'},
     ]
   }
> rs.initiate(config)
```

#### mongos
```
mongos> sh.addShard( "rs0/<one of mongod ip>:27018")
mongos> sh.addShard( "rs1/<one of mongod ip>:27028")
mongos> sh.addShard( "rs2/<one of mongod ip>:27038")
mongos> sh.enableSharding("ycsb")
mongos> sh.shardCollection("ycsb.usertable", { _id : "hashed" } )
```

## YCSB
```
# ./bin/ycsb load mongodb -P workloads/workloada -p mongodb.url=mongodb://<mongos ip>:27017/ycsb?w=0 -s
# ./bin/ycsb run mongodb -P workloads/workloada -p mongodb.url=mongodb://<mongos ip>:27017/ycsb?w=0 -s
```
