1. How to see a container logs
```
[train@localhost miuul]$ docker container logs postgresql
The files belonging to this database system will be owned by user "postgres".
This user must also own the server process.

The database cluster will be initialized with locale "en_US.utf8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".
...
...
```

2. How to tail container logs
` docker container logs postgresql | tail`

3. How to stream container logs
` docker container logs postgresql -f `