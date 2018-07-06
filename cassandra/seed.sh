HOST_IP=`hostname -I | awk '{print $1}'`
docker run -d --name csdr_seed --hostname csdr_seed -e CASSANDRA_BROADCAST_ADDRESS=$HOST_IP -p 9042:9042 -p 9160:9160 -p 7000:7000 cassandra:3.11.2
