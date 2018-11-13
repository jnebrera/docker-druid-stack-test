#!/usr/bin/env bash

# Start Zookeeper

/kafka_2.11-1.1.0/bin/zookeeper-server-start.sh -daemon /kafka_2.11-1.1.0/config/zookeeper.properties

# Start Druid

/druid-0.12.3/bin/coordinator.sh start
/druid-0.12.3/bin/overlord.sh start
/druid-0.12.3/bin/middleManager.sh start
/druid-0.12.3/bin/broker.sh start 
/druid-0.12.3/bin/historical.sh start

# Start Kafka

/kafka_2.11-1.1.0/bin/kafka-server-start.sh /kafka_2.11-1.1.0/config/server.properties
