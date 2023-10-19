
# Docker compose intro 

## What is Docker Compose?
Compose is a tool for **defining and running multi-container Docker applications**. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.   

- Compose has traditionally been focused on **development and testing** workflows. You can easily create and run isolated development/test/POC environment. Bu can be used single-host deployments in production.

- You define your design in a file named `docker-compose.yml` or `docker-compose.yaml`    

- It is an psuedo file don't run it now. Wait the example.
docker-compose.yml
```
version: '3.7'
services:
  web:
    build: 
		context: .
    ports:
		- "5000:5000"
    volumes:
		- .:/code
		- myvol:/var/log
    links:
		- redis
  redis:
    image: redis
volumes:
  myvol:
  ```

  - Then you run `docker-compose up` command. That's it.

  - You have to install docker-compose seperately from docker-ce.  
  https://docs.docker.com/compose/install/  
  But in your machine it is already installed.



# Example 
In this example you will create a Flask web application that maintains a hit counter in Redis. It is simple and just counts and shows how many visitors are welcomed so far.

- Create a project directory  and navigate in it.  

`[train@localhost play]$ mkdir docker-compose-example`  

## requirements.txt
- Create `requirements.txt` in your `docker-compose-example` directory and paste following python packeges 
```
flask
redis
```

## Python application 
- Create a python file named `app.py` and paste in the following codes.  
```
import time

import redis
from flask import Flask

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)


def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


@app.route('/')
def hello():
    count = get_hit_count()
    return 'Hello World! I have been seen {} times.\n'.format(count)
```

## Dockerfile

Dockerfile 
```
FROM python:3.8-slim
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
```

## docker-compose file 
docker-compose.yml
```
version: '3.7'
services:
  web:
    build:
      context: .
    ports:
      - "5000:5000"
    volumes:
      - .:/code
      - logvolume01:/var/log
    links:
      - redis
  redis:
    image: redis
    volumes:
      - v_redis:/data
volumes:
  logvolume01:
  v_redis:
```

## run docker-compose:  
`docker-compose up --build -d`

## List containers
- docker-compose ps 
```
docker-compose ps
 
NAME                    COMMAND                  SERVICE             STATUS              PORTS
dockercompose-redis-1   "docker-entrypoint.s…"   redis               running             6379/tcp
dockercompose-web-1     "flask run"              web                 running             0.0.0.0:5000->5000/tcp, :::5000->5000/tcp
```

- Observe the results  
Open browser and type http://localhost:5000/   
You will see **Hello World! I have been seen X times**. 

## Stop docker-compose 

It removes containers  (Always run this command where the docker-compose.yaml file is)
```
docker-compose down
```

























