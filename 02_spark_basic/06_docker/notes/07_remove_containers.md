## remove container
Before remove you have to stop container or force to remove 

`docker rm <container_id>`  
`docker rm <container name>`

## prune
Removes all the containers.  
```
[train@localhost docker]$ docker container prune
WARNING! This will remove all stopped containers.
Are you sure you want to continue? [y/N] y
Deleted Containers:
8ab9895ccdaacc31dbd4d840461a26ff80b4c4f96a968eb93d3f97c24df29df7
7f7122cf98e23a67f5c2016496fab15485f4305fba21990afc726f8f32af2d24

Total reclaimed space: 3.356MB


[train@localhost docker]$ docker container ps -a
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

```

