HOST_IP=`hostname -I | awk '{print $1}'`
docker run -d --name csdr --hostname csdr -e CASSANDRA_BROADCAST_ADDRESS=$HOST_IP -e CASSANDRA_SEEDS=$1 -p 9042:9042 -p 9160:9160 -p 7000:7000 cassandra:3.11.2
