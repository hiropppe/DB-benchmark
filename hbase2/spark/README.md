test memo

#### Run SHC Scala Example
```
spark-submit --verbose --class org.apache.spark.sql.execution.datasources.hbase.examples.HBaseSource --master yarn --deploy-mode cluster --packages com.hortonworks:shc-core:1.1.3-2.3-s_2.11 --files /usr/local/hbase/conf/hbase-site.xml examples/target/shc-examples-1.1.3-2.3-s_2.11.jar
```

### Run SHC Python Example
```
spark-submit --verbose --master yarn --deploy-mode cluster --packages com.hortonworks:shc-core:1.1.3-2.3-s_2.11 --files /usr/local/hbase/conf/hbase-site.xml read_example.py
```
