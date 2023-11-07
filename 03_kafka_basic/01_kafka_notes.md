## Connect kafka container
```commandline
docker exec -it kafka bash
```

## Create Topic
```commandline
 /kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --create --topic test1 --replication-factor 1 --partitions 3
```

## List Topics
```commandline
 /kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --list
```
- Example output
```commandline
test1
```