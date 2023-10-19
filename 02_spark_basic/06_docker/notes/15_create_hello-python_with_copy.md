## Create an image with COPY

This time we won't create hello.py file with RUN command. Instead we will COPY inside to image.  

- Create a directory and cd in it.
[train@trainvm play]$ mkdir python-copy-image
[train@trainvm play]$ cd python-copy-image/

- Create `hello.py` file on linux machine  and write inside the following 

` print("Hello I am copied to container.") `  


- Dockerfile
```
FROM python:3.8-slim

WORKDIR /app

COPY ./hello.py /app

CMD ["python","hello.py"]
```

- Build
```
docker build -t erkansirin78/hello-python:1.0
```

- Run docker container
```
docker run --rm erkansirin78/hello-python:1.0

Hello I am copied to container.
```


# Optional 

## COPY whole app folder to image  

- Docker file
```
FROM python:3.8-slim

COPY ./app /app

WORKDIR /app

CMD ["python","hello.py"]
```
- Build
```
docker image build -t python_app_folder -f 
```

- Run
```
docker run --rm python_app_folder
Hello I am copied to container with app folder and I was written on linux machine outside the docker container.
```

- We can override CMD command
```
docker run --rm python_app_folder hostname                            
ecd1b1a80330

docker run --rm python_app_folder echo "Hello"
Hello
```
