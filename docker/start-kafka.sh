#!/bin/bash

until nc localhost 2181 <<< "ruok" > /dev/null; do
  sleep 0.5
done


$KAFKA_HOME/bin/kafka-server-start.sh /config/server.properties
