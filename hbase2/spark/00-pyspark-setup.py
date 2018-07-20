import os
import sys
spark_home = os.environ.get('SPARK_HOME', None)
if not spark_home:
    raise ValueError('SPARK_HOME environment variable is not set')
os.environ['PYSPARK_SUBMIT_ARGS'] = ("--master yarn --deploy-mode client --packages com.hortonworks:shc-core:1.1.3-2.3-s_2.11 --files /usr/local/hbase/conf/hbase-site.xml pyspark-shell") 
sys.path.insert(0, os.path.join(spark_home, 'python'))
sys.path.insert(0, os.path.join(spark_home, 'python/lib/py4j-0.10.7-src.zip'))
exec(open(os.path.join(spark_home, 'python/pyspark/shell.py')).read())
