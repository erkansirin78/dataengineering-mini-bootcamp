## Connect spark container
```commandline
docker exec -it spark bash
```

## Check spark version
```commandline
spark-submit --version
```
- Example output
```commandline
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 3.4.1
      /_/

Using Scala version 2.12.17, OpenJDK 64-Bit Server VM, 17.0.9
Branch HEAD
Compiled by user centos on 2023-06-19T23:01:01Z
Revision 6b1ff22dde1ead51cbf370be6e48a802daae58b6
Url https://github.com/apache/spark
Type --help for more information.
```

## Run Jupyter Lab
```commandline
jupyter lab --ip 0.0.0.0 --port 8888 --allow-root
```
- Copy 127.0.0.1 link example: http://127.0.0.1:8888/lab?token=063a6002dbf329b7a16f6fdb29b1df98aa3f66863912518c

- Paste it your browser