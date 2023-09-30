FROM openjdk:11.0.10-jre-buster

ENV HTTP_PROXY=$HTTP_PROXY
ENV HTTPS_PROXY=$HTTPS_PROXY

RUN apt-get update && \
    apt-get install -y curl

ENV KAFKA_VERSION 3.2.0
ENV SCALA_VERSION 2.12

RUN  mkdir /tmp/kafka && \
    curl "https://archive.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" \
    -o /tmp/kafka/kafka.tgz && \
    mkdir /kafka && cd /kafka && \
    tar -xvzf /tmp/kafka/kafka.tgz --strip 1

RUN mkdir -p /data/kafka

COPY start-kafka.sh  /usr/bin

RUN chmod +x  /usr/bin/start-kafka.sh

CMD ["start-kafka.sh"]