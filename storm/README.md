クローラ候補の実験ログ、下記の理由により不採用
- HBaseをバックエンドにすることもできるととあったが実装がない（たしかに既にあるとは書いてなかった）
- DeduplicationやScoringなどNutchにあった基本機能がまだなさそう
- Spark Streamingがある中でもう一つストリーミング基盤ができるのがいまいち (厳密にはユースケース違いそうだけど)

### Setup Cluster

#### Run Zookeeper
Single keeper
```
$ sh ./zookeeper.sh
```
Ensemble
```
$ sh ./zookeeper.sh <#servers> <my_id>
```

#### Run Nimbus
```
$ sh ./nimbus.sh
```

#### Run Supervisor (all worker)
```
$ sh ./supervisor.sh
```

### StormCrawler

#### Build StormCrawler jar
```
$ git clone https://github.com/DigitalPebble/storm-crawler.git
$ cd storm-crawler
$ mvn archetype:generate -DarchetypeGroupId=com.digitalpebble.stormcrawler -DarchetypeArtifactId=storm-crawler-archetype -DarchetypeVersion=1.10
 :
Define value for property 'groupId': com.jp21.crawler
Define value for property 'artifactId': stormcrawler
Define value for property 'version' 1.0-SNAPSHOT: :
Define value for property 'package' com.jp21.crawler: :
Confirm properties configuration:
groupId: com.jp21.crawler
artifactId: stormcrawler
version: 1.0-SNAPSHOT
package: com.jp21.crawler
 Y: : Y
 :
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 28.685 s
[INFO] Finished at: 2018-07-26T15:22:37+09:00
[INFO] Final Memory: 16M/180M
[INFO] ------------------------------------------------------------------------

$ cd stormcrawler/
$ mvn clean package
```

#### Run sample crawler
Copy stormcrawler.jar and crawler-conf.yaml to nimbus container (jar must be in storm classpath).
```
bash-4.4# storm jar /apache-storm-1.2.2/stormcrawler-1.0-SNAPSHOT.jar com.jp21.crawler.CrawlTopology -conf crawler-conf.yaml 
```
