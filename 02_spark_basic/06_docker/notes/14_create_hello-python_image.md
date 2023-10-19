- Create a directory and cd in it.
 mkdir first-python-image
 cd first-python-image/
 
- Dockerfile
```
FROM python:3.8-slim

RUN mkdir /app; touch /app/hello.py

WORKDIR /app

RUN echo "print(\"Hello I am a container from python base image\")" > hello.py

CMD ["python","hello.py"]
```

- Build image
```
docker image build -t erkansirin78/hello-python:1.0 .
```
- Run a container
```
docker run --rm erkansirin78/hello-python:1.0

Hello I am a container from python base image
```

- Push image to dockerhub
```
docker image push erkansirin78/hello-python:1.0
```


