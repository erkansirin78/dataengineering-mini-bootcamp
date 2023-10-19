- Dockerfile enables us to create our own images.  

## Creating a Dockerfile  

### -> Specify base image 

### -> Run some commands to additional intallations 

### -> Specify a command on container start up  

- create an empty folder and inside it create a file named `Dockerfile` no extention and same exact name.  

- Inside `Dockerfile`  
```
# Use an existing image as base image
FROM alpine

# Donwload and install a dependency
RUN apk add --update redis

EXPOSE 6379

# Tell the image what to do when it starts as container
CMD ["redis-server"]
```

Run the following command where the same directory with Dockerfile  
(Dont forget the . at the end)
` docker image build -t erkansirin78/redis-alpine:atscale5 . `  

Now we can create a container from newly created image.  
`  docker run --rm -p 6379:6379 -d erkansirin78/redis-alpine:atscale5 `  

We see redis ready.  

- Open second terminal: ` nc -vt localhost 6379 `  

You will see connection output.

Most important Dockerfile instructions are **FROM, RUN** and **CMD**  

- If you put different name other than `Dockerfile`, you have to specify `-f OtherDockerName`    

- Examle: `docker image build -f OtherDockerFile -t erkansirin78/redis-centos7:atscale . `  



## Optional part
Another way to create redis on CenOS7 base image but we try to install manually first

Dockerfile
```
# Use an existing image as base image
FROM centos:7

# Donwload and install a dependency
RUN yum install epel-release -y && \
    yum update -y && \
    yum install redis -y && \
    yum clean all

EXPOSE 6379

# Tell the image what to do when it starts as container
CMD ["/usr/bin/redis-server"]
```

` docker image build -t erkansirin78/redis-centos7:atscale . `  

Now we can create a container from newly created image.  
`  docker run --rm -p 6379:6379 erkansirin78/redis-centos7:atscale `  

We see redis ready.  

- Open second terminal: ` nc -vt localhost 6379 `  


- If you put different name other than `Dockerfile`, you have to specify `-f OtherDockerName`    

- Examle: `docker image build -f OtherDockerFile -t erkansirin78/redis-centos7:atscale . `  

- You have to prefix your image tag. Only official images don't have prefix like redis, postgres etc.  

- Do not use your root directory, /, as the PATH as it causes the build to transfer the entire contents of your hard drive to the Docker daemon.