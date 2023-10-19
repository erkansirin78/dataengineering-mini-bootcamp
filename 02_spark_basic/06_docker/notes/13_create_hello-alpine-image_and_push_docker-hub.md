In this demo we will make a simple Dockerfile, create container from it and push image to dockerhub.    

## Create a Docker file
HelloAlpineDockerfile
```
FROM alpine:3.11

CMD ["echo", "Hello from alpine:3.11"]
```

## Build docker image
```
docker image build -f HelloAlpineDockerfile -t erkansirin78/hello-alpine:2.0 .
```

## Create and start container from image
```
docker run --rm erkansirin78/hello-alpine:2.0

Hello, I am a container created by alpine:3.11 base image
```

## Push image to Dockerhub
- Login to Dockerhub on terminal
```
docker login
```

- Push image
```
docker image push erkansirin78/hello-alpine:2.0
```

- Go to dockerhub and see your image  



