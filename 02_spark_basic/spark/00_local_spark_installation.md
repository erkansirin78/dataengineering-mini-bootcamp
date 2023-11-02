## Install chrony
```commandline
sudo yum install chrony
sudo systemctl enable chronyd
sudo systemctl start chronyd
```

## Create virtual environment
```commandline
conda create --name sparkenv python=3.8
conda activate sparkenv
```
## Create working directory
```commandline
mkdir spark_local
cd spark_local
sudo mkdir /opt/examples/datasets
sudo chown train:train -R /opt/examples/datasets/
```

## Install Java
```commandline
sudo yum -y install java-11-openjdk-devel.x86_64
```

## Install Spark
```commandline
curl -o spark-3.4.1-bin-hadoop3.tgz https://dlcdn.apache.org/spark/spark-3.4.1/spark-3.4.1-bin-hadoop3.tgz &&     tar -xzvf spark-3.4.1-bin-hadoop3.tgz

sudo mv spark-3.4.1-bin-hadoop3 /opt/spark
rm -rf spark-3.4.1-bin-hadoop3.tgz


vi ~/.bashrc

# paste following to bottom 
export SPARK_HOME=/opt/spark
export PATH=$PATH:$SPARK_HOME/bin
export PATH=$PATH:$SPARK_HOME/sbin
```

## Install python packages
```commandline
python -m pip install -r requirements.txt
```

## Start Jupyter lab
```commandline
jupyter lab --ip 0.0.0.0 --port 8888
```
