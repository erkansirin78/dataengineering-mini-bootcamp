# Healthcheck 

Dockerfile:
```
FROM nginx:1.17.7

RUN apt-get update && apt-get install -y procps
```

- Build image
` docker build -t docker-health . `   

- Run docker container
` docker run --rm --name docker-health -d -p 8081:80 docker-health  `    


- Open browser and reach http://localhost:8081/ see nginx welcome page.


- See the docker status  
```
 docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                  NAMES
ad28e9e85506        docker-health       "nginx -g 'daemon of…"   2 minutes ago       Up 2 minutes        0.0.0.0:8081->80/tcp   docker-health
```

- Connect to container and see the processes 
```
[train@localhost healthcheck]$ docker exec -it docker-health bash
root@1b65837f5c4b:/# ps -aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.3  0.0  10620  3436 ?        Ss   21:01   0:00 nginx: master process nginx -g daemon off;
nginx        6  0.0  0.0  11076  1500 ?        S    21:01   0:00 nginx: worker process
root         7  2.5  0.0   3856  1904 pts/0    Ss   21:01   0:00 bash
root        13  0.0  0.0   7628  1336 pts/0    R+   21:01   0:00 ps -aux
```

You see PID=1 process:
```
root         1  0.3  0.0  10620  3436 ?        Ss   21:01   0:00 nginx: master process nginx -g daemon off;  
```
- The process started by the ENTRYPOINT or CMD of the Dockerfile runs as a PID 1.  
A process running as PID 1 inside a container is treated specially as it ignores any signal, such as SIGINT or SIGTERM, and won’t terminate unless it’s coded to do so.  

- As long as PID 1 is up and running, the Docker engine will keep reporting the container as being up and running too. **The Docker engine doesn’t really know, nor cares, what a containerised application is doing.**   

- exit codes:  
```
0: success - the container is healthy and ready for use
1: unhealthy - the container is not working correctly
2: reserved - do not use this exit code”
```

- Health-check parameters
The HEALTHCHECK command can also be used with four different options:
```
--interval=DURATION (default: 30s)
--timeout=DURATION (default: 30s)
--start-period=DURATION (default: 0s)
--retries=N (default: 3)
```

- Update your Dockerfile 
```
FROM nginx:1.17.7

# To use ps command
RUN apt-get update && apt-get install -y procps  && apt-get install -y curl

HEALTHCHECK --interval=20s --timeout=5s CMD curl --fail http://localhost/ || exit 1

EXPOSE 80
```
- ` docker build -t docker-health . `

- ` docker run --rm --name docker-health -d -p 8081:80 docker-health  ` 

- Wait a while then see health status  
```
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                             PORTS                  NAMES
e1374c01874c        docker-health       "nginx -g 'daemon of…"   15 seconds ago      Up 14 seconds (health: starting)   0.0.0.0:8081->80/tcp   docker-health
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                             PORTS                  NAMES
e1374c01874c        docker-health       "nginx -g 'daemon of…"   16 seconds ago      Up 15 seconds (health: starting)   0.0.0.0:8081->80/tcp   docker-health
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                             PORTS                  NAMES
e1374c01874c        docker-health       "nginx -g 'daemon of…"   17 seconds ago      Up 16 seconds (health: starting)   0.0.0.0:8081->80/tcp   docker-health
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                             PORTS                  NAMES
e1374c01874c        docker-health       "nginx -g 'daemon of…"   18 seconds ago      Up 17 seconds (health: starting)   0.0.0.0:8081->80/tcp   docker-health
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                             PORTS                  NAMES
e1374c01874c        docker-health       "nginx -g 'daemon of…"   20 seconds ago      Up 19 seconds (health: starting)   0.0.0.0:8081->80/tcp   docker-health
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                    PORTS                  NAMES
e1374c01874c        docker-health       "nginx -g 'daemon of…"   21 seconds ago      Up 20 seconds (healthy)   0.0.0.0:8081->80/tcp   docker-health
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                    PORTS                  NAMES
e1374c01874c        docker-health       "nginx -g 'daemon of…"   22 seconds ago      Up 21 seconds (healthy)   0.0.0.0:8081->80/tcp   docker-health
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                    PORTS                  NAMES
e1374c01874c        docker-health       "nginx -g 'daemon of…"   23 seconds ago      Up 23 seconds (healthy)   0.0.0.0:8081->80/tcp   docker-health
```