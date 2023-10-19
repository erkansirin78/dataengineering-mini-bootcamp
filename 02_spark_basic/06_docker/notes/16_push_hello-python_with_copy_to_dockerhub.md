## Get login from terminal

```
docker login
```
## List docker images
```
[train@localhost hello_python]$ docker images
REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE
erkansirin78/hellopython       2021-01             f5b07b5b1052        3 days ago          874MB
```

## Push the image
```
docker tag erkansirin78/hellopython:2021-01 erkansirin78/hellopython:2021-01

docker image push erkansirin78/hellopython:2021-01

```

- Go to dockerhub and see your image

## Add a new tag
```
docker tag erkansirin78/hellopython:2022-01 erkansirin78/hellopython:2021-01
```

## Push new tag
```
docker image push erkansirin78/hellopython:2022-02
```

- Go to dockerhub and see new tag