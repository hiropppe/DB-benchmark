test memo

#### Run first (seed) node
```
$ sh ./seed.sh
```

### Run other nodes
```
$ sh ./csdr.sh <first server IP>
```

#### CQL 
starts another Cassandra container instance and runs cqlsh against running container.
```
$ docker run -it --link csdr:cassandra --rm cassandra:3.11.2 cqlsh cassandra
```

#### Creating a table for use with YCSB
```
Connected to Test Cluster at cassandra:9042.
[cqlsh 5.0.1 | Cassandra 3.11.2 | CQL spec 3.4.4 | Native protocol v4]
Use HELP for help.
cqlsh> CREATE KEYSPACE ycsb WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor': 3 };
cqlsh> USE ycsb;
cqlsh:ycsb>
cqlsh:ycsb> CREATE TABLE usertable (
        ...             y_id varchar primary key,
        ...             field0 varchar,
        ...             field1 varchar,
        ...             field2 varchar,
        ...             field3 varchar,
        ...             field4 varchar,
        ...             field5 varchar,
        ...             field6 varchar,
        ...             field7 varchar,
        ...             field8 varchar,
        ...             field9 varchar);
``
```

#### YCSB
```
# ./bin/ycsb run cassandra2-cql -P workloads/workloada -p "hosts=<ip1> <ip2> <ip3>"
# ./bin/ycsb run cassandra2-cql -P workloads/workloada -p "hosts=<ip1> <ip2> <ip3>"
```
