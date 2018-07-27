docker run -d --restart always --name storm-master -v $(pwd)/storm.yaml:/conf/storm.yaml --net host storm:1.2.2 storm nimbus
