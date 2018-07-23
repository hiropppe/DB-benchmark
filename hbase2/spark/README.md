### SHC Examples
#### Spark Submit (Scala)
```
root@spark:~# spark-submit --verbose --class org.apache.spark.sql.execution.datasources.hbase.examples.HBaseSource --master yarn --deploy-mode cluster --packages com.hortonworks:shc-core:1.1.3-2.3-s_2.11 --files /usr/local/hbase/conf/hbase-site.xml ~/shc/examples/target/shc-examples-1.1.3-2.3-s_2.11.jar
```
#### Spark Submit (Python)
```
root@spark:~# spark-submit --verbose --master yarn --deploy-mode cluster --packages com.hortonworks:shc-core:1.1.3-2.3-s_2.11 --files /usr/local/hbase/conf/hbase-site.xml ~/examples/shc_read_submit_example.py
```
#### IPython
```
root@spark:~# ipython --profile=pyspark
 :
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /__ / .__/\_,_/_/ /_/\_\   version 2.3.1
      /_/

Using Python version 2.7.12 (default, Dec  4 2017 14:50:18)
SparkSession available as 'spark'.

In [1]: sc
Out[1]: <SparkContext master=yarn appName=pyspark-shell>

In [2]: from pyspark.sql import SQLContext

In [3]: sqlc = SQLContext(sc)

In [4]: data_source_format = 'org.apache.spark.sql.execution.datasources.hbase'
   ...:
   ...: catalog = ''.join("""{
   ...:     "table":{"namespace":"default", "name":"shcExampleTable"},
   ...:     "rowkey":"key",
   ...:     "columns":{
   ...:         "col0":{"cf":"rowkey", "col":"key", "type":"string"},
   ...:         "col1":{"cf":"cf1", "col":"col1", "type":"boolean"},
   ...:         "col2":{"cf":"cf2", "col":"col2", "type":"double"},
   ...:         "col3":{"cf":"cf3", "col":"col3", "type":"float"},
   ...:         "col4":{"cf":"cf4", "col":"col4", "type":"int"},
   ...:         "col5":{"cf":"cf5", "col":"col5", "type":"bigint"},
   ...:         "col6":{"cf":"cf6", "col":"col6", "type":"smallint"},
   ...:         "col7":{"cf":"cf7", "col":"col7", "type":"string"},
   ...:         "col8":{"cf":"cf8", "col":"col8", "type":"tinyint"}
   ...:     }
   ...: }""".split())
   ...:
   ...: df = sqlc.read.options(catalog=catalog).format(data_source_format).load()
   ...:

In [5]: df
Out[5]: DataFrame[col0: string, col1: boolean, col2: double, col3: float, col4: int, col5: bigint, col6: smallint, col7: string, col8: tinyint]

In [6]: df.select("col0", "col1", "col2", "col3", "col4", "col5", "col6", "col7", "col8").show()
+------+-----+----+----+----+----+----+--------------+----+
|  col0| col1|col2|col3|col4|col5|col6|          col7|col8|
+------+-----+----+----+----+----+----+--------------+----+
|row000| true| 0.0| 0.0|   0|   0|   0| String0 extra|   0|
|row001|false| 1.0| 1.0|   1|   1|   1| String1 extra|   1|
|row002| true| 2.0| 2.0|   2|   2|   2| String2 extra|   2|
|row003|false| 3.0| 3.0|   3|   3|   3| String3 extra|   3|
|row004| true| 4.0| 4.0|   4|   4|   4| String4 extra|   4|
|row005|false| 5.0| 5.0|   5|   5|   5| String5 extra|   5|
|row006| true| 6.0| 6.0|   6|   6|   6| String6 extra|   6|
|row007|false| 7.0| 7.0|   7|   7|   7| String7 extra|   7|
|row008| true| 8.0| 8.0|   8|   8|   8| String8 extra|   8|
|row009|false| 9.0| 9.0|   9|   9|   9| String9 extra|   9|
|row010| true|10.0|10.0|  10|  10|  10|String10 extra|  10|
|row011|false|11.0|11.0|  11|  11|  11|String11 extra|  11|
|row012| true|12.0|12.0|  12|  12|  12|String12 extra|  12|
|row013|false|13.0|13.0|  13|  13|  13|String13 extra|  13|
|row014| true|14.0|14.0|  14|  14|  14|String14 extra|  14|
|row015|false|15.0|15.0|  15|  15|  15|String15 extra|  15|
|row016| true|16.0|16.0|  16|  16|  16|String16 extra|  16|
|row017|false|17.0|17.0|  17|  17|  17|String17 extra|  17|
|row018| true|18.0|18.0|  18|  18|  18|String18 extra|  18|
|row019|false|19.0|19.0|  19|  19|  19|String19 extra|  19|
+------+-----+----+----+----+----+----+--------------+----+
only showing top 20 rows
```
#### Jupyter Notebook (using findspark)
http://192.168.88.180:18080/gitbucket/RD/YCSB-dockers/blob/master/hbase2/spark/examples/shc_read_example_by_findspark.ipynb
