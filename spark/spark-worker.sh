#!/bin/bash

if ! getent hosts spark-master; then
  sleep 5
  exit 0
fi

/opt/spark/bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077 --webui-port 8081