## Is docker server (daemon) running?  
```
[train@localhost play]$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
     Docs: https://docs.docker.com
```

## Start docker  
```
[train@localhost play]$ sudo systemctl start docker

# Check status
[train@localhost play]$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Fri 2020-09-04 16:34:33 +03; 2s ago
     Docs: https://docs.docker.com
 Main PID: 5173 (dockerd)
    Tasks: 13
   Memory: 145.2M
   CGroup: /system.slice/docker.service
           └─5173 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
```
## Docker cli command format
` docker [OPTIONS] COMMAND `

## There are mainly two types of command: management and command

# Some frequently used management commands
```
Management Commands:
  container   Manage containers
  image       Manage images
  network     Manage networks
  volume      Manage volumes
```
## Some frequently used commads
```
Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  exec        Run a command in a running container
  images      List images
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  login       Log in to a Docker registry
  logs        Fetch the logs of a container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  start       Start one or more stopped containers
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
```
## Docker version
```
[train@localhost play]$ docker version
Client: Docker Engine - Community
 Version:           19.03.12
 API version:       1.40
 Go version:        go1.13.10
 Git commit:        48a66213fe
 Built:             Mon Jun 22 15:46:54 2020
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.12
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.13.10
  Git commit:       48a66213fe
  Built:            Mon Jun 22 15:45:28 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.2.13
  GitCommit:        7ad184331fa3e55e52b890ea95e65ba581ae3429
 runc:
  Version:          1.0.0-rc10
  GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683
  ```

  ## First docker container: hello-world
```
  [train@localhost play]$ docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
0e03bdcc26d7: Pull complete
Digest: sha256:7f0a9f93b4aa3022c3a4c147a449bf11e0941a1fd0bf4a8e6c9408b2600777c5
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
 ```

 ## Run second time

 [train@localhost play]$ docker run hello-world
 ```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
  ```

  This time image is found locally and we don't have to go docker hub.

  ## List running containers
```
[train@localhost play]$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```
Terminal-1:
```
[train@localhost play]$ docker run busybox ping -c 20 google.com
PING google.com (172.217.169.174): 56 data bytes
64 bytes from 172.217.169.174: seq=0 ttl=117 time=24.950 ms
64 bytes from 172.217.169.174: seq=1 ttl=117 time=21.418 ms
64 bytes from 172.217.169.174: seq=2 ttl=117 time=23.365 ms
64 bytes from 172.217.169.174: seq=3 ttl=117 time=21.918 ms
..
..
```
Terminal-2
```
[train@localhost play]$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
c272c641b588        busybox             "ping -c 20 google.c…"   9 seconds ago       Up 7 seconds                            angry_stonebraker
```
Busybox prints output of our command.

## List running and exited containers
```
[train@localhost play]$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
c272c641b588        busybox             "ping -c 20 google.c…"   3 minutes ago       Exited (0) 2 minutes ago                        angry_stonebraker
6733f4794fde        busybox             "ping -20 google.com"    3 minutes ago       Exited (1) 3 minutes ago                        confident_nash
98389e53fe09        hello-world         "/hello"                 18 minutes ago      Exited (0) 18 minutes ago                       nice_jennings
34d2e4d9cf4e        hello-world         "/hello"                 2 hours ago         Exited (0) 2 hours ago                          dreamy_shte
```


## docker run creates and stars the container

docker run = docker create + docker start  

- docker container stop
- docker container start













