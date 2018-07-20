test memo

#### SHC Scala Example
```
spark-submit --verbose --class org.apache.spark.sql.execution.datasources.hbase.examples.HBaseSource --master yarn --deploy-mode cluster --packages com.hortonworks:shc-core:1.1.3-2.3-s_2.11 --files /usr/local/hbase/conf/hbase-site.xml examples/target/shc-examples-1.1.3-2.3-s_2.11.jar
```

#### SHC Python Example
```
spark-submit --verbose --master yarn --deploy-mode cluster --packages com.hortonworks:shc-core:1.1.3-2.3-s_2.11 --files /usr/local/hbase/conf/hbase-site.xml examples/shc_read_submit_example.py
```

#### IPythhon
```
# ipython --profile=pyspark

from pyspark import SparkContext
from pyspark.sql import SQLContext

data_source_format = 'org.apache.spark.sql.execution.datasources.hbase'
 
catalog = ''.join("""{
    "table":{"namespace":"default", "name":"shcExampleTable"},
    "rowkey":"key",
    "columns":{
        "col0":{"cf":"rowkey", "col":"key", "type":"string"},
        "col1":{"cf":"cf1", "col":"col1", "type":"boolean"},
        "col2":{"cf":"cf2", "col":"col2", "type":"double"},
        "col3":{"cf":"cf3", "col":"col3", "type":"float"},
        "col4":{"cf":"cf4", "col":"col4", "type":"int"},
        "col5":{"cf":"cf5", "col":"col5", "type":"bigint"},
        "col6":{"cf":"cf6", "col":"col6", "type":"smallint"},
        "col7":{"cf":"cf7", "col":"col7", "type":"string"},
        "col8":{"cf":"cf8", "col":"col8", "type":"tinyint"}
    }
}""".split())
 
df = sqlc.read.options(catalog=catalog).format(data_source_format).load()
 
df.select("col0", "col1", "col2", "col3", "col4", "col5", "col6", "col7", "col8").show()
```

#### Jupyter Notebook
```
# jupyter notebook --allow-root --ip 0.0.0.0
```

