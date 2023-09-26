#!/bin/bash

/kafka/bin/kafka-storage.sh format --config /kafka/config/server.properties --cluster-id 'EP6hyiddQNW5FPrAvR9kWw' --ignore-formatted

/kafka/bin/kafka-server-start.sh /kafka/config/server.properties