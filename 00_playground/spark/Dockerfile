FROM python:3.8-slim

# Install OpenJDK 17
RUN mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$PATH:$JAVA_HOME/bin
RUN echo $JAVA_HOME

RUN apt-get update -y
RUN apt-get install -y libzbar-dev 
RUN apt-get install -y bash 
RUN apt-get install -y gcc 
RUN apt-get install -y git 
RUN apt-get install -y libc-dev 
RUN apt-get install -y curl wget vim nano   
RUN apt-get install -y iputils-ping telnet openssh-client net-tools
RUN apt-get install -y   man 
RUN apt-get install -y unzip 
RUN apt-get install -y vim-tiny 
RUN apt-get install -y bc 
RUN apt-get install -y openssh-server 
RUN apt-get install -y thrift-compiler 
#RUN apt-get install -y netcat 
RUN apt-get install -y sudo
RUN apt-get install -y build-essential
RUN apt-get autoremove -y
# RUN apt-get install -y dos2unix
RUN apt-get clean

# install spark
RUN curl -o spark-3.4.1-bin-hadoop3.tgz https://dlcdn.apache.org/spark/spark-3.4.1/spark-3.4.1-bin-hadoop3.tgz && \
    tar -xzvf spark-3.4.1-bin-hadoop3.tgz && \
    mv spark-3.4.1-bin-hadoop3 /opt/spark && \
    rm -rf spark-3.4.1-bin-hadoop3.tgz

RUN curl -o hadoop-aws-3.3.4.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.4/hadoop-aws-3.3.4.jar && \
    curl -o  aws-java-sdk-bundle-1.12.262.jar https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.262/aws-java-sdk-bundle-1.12.262.jar && \
    curl -o postgresql-42.3.5.jar https://jdbc.postgresql.org/download/postgresql-42.3.5.jar && \
    mv aws-java-sdk-bundle-1.12.262.jar hadoop-aws-3.3.4.jar postgresql-42.3.5.jar /opt/spark/jars/

ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PATH=$PATH:$SPARK_HOME/sbin
ENV PYTHONPATH=$SPARK_HOME/python3:$SPARK_HOME/python3/lib/py4j-0.10.7-src.zip:$PYTHONPATH

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install MinIO Client
RUN curl -o mc https://dl.min.io/client/mc/release/linux-amd64/mc && chmod +x mc && mv mc /usr/local/bin/

RUN mc alias set dataops_minio http://minio:9000 dataops Ankara06 --api S3v4