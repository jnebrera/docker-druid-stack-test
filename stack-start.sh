#!/usr/bin/env bash

# Start Zookeeper

/kafka_2.12-2.1.0/bin/zookeeper-server-start.sh -daemon /kafka_2.12-2.1.0/config/zookeeper.properties

# Start Druid

/apache-druid-0.13.0-incubating/bin/coordinator.sh start
/apache-druid-0.13.0-incubating/bin/overlord.sh start
/apache-druid-0.13.0-incubating/bin/middleManager.sh start
/apache-druid-0.13.0-incubating/bin/broker.sh start 
/apache-druid-0.13.0-incubating/bin/historical.sh start

# Start Kafka

/kafka_2.12-2.1.0/bin/kafka-server-start.sh /kafka_2.12-2.1.0/config/server.properties
