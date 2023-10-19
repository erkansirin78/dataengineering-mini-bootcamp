1. Create development directory
```
[train@localhost play]$ mkdir nodejs-mongo-app
[train@localhost play]$ cd nodejs-mongo-app/
```

2. Create necessary files and folder as seen below. (Pictures in image folder can be any picture smaller than 1000x1000 pixels)
```
(venvspark) [train@localhost play]$ tree nodejs-mongo-app/
nodejs-mongo-app/
├── app
│   ├── images
│   │   ├── docker-container-transparent.png
│   │   └── who_is_datascientist_960x640.jpg
│   ├── index.html
│   ├── package.json
│   ├── package-lock.json
│   └── server.js
├── docker-compose.yaml
├── Dockerfile
└── README.md
```

3. Pull mongodb and mongo express images from Dockerhub  
` docker pull mongo ` and `docker pull mongo-express`  

4. Check mongo images
```
[train@localhost nodejs-mongo-app]$ docker images | grep mongo
mongo-express                         latest              a7abf47ed907        13 days ago         130MB
mongo                                 latest              ba0c2ff8d362        3 weeks ago         492MB
```

5. Create a docker network
`docker network create mongo-network`
```
[train@localhost nodejs-mongo-app]$ docker network ls | grep mongo
53bba33e3b9e        mongo-network       bridge              local
```

6. Run mongodb container and attach it to mongo-network
```
docker run -d \
-p 27017:27017 \
--network mongo-network \
--name mongodb \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=Ankara06 \
mongo
```
```
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                      NAMES
1b65a012dfba        mongo               "docker-entrypoint.s…"   8 seconds ago       Up 6 seconds        0.0.0.0:27017->27017/tcp   mongodb
```

7. Run mongo-express container and attach it mongo-network
```
docker run -d \
-p 8081:8081 \
--network mongo-network \
--name mongo-express \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=Ankara06 \
-e ME_CONFIG_MONGODB_SERVER=mongodb \
mongo-express
```
- ME_CONFIG_MONGODB_SERVER must be mongo container name that you created before.

- Go to browser http://localhost:8081 see the mongo-express landing page. 

- On mongo-express ui create a database named **my-db** then create a collection named **users**  

8. Stop and remove mongodb and docker-express containers

9. Create Dockerfile to make your app an image.
```
FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN npm install express && npm install mongodb

RUN mkdir -p /home/app

COPY ./app /home/app

CMD ["node", "/home/app/server.js"]
```

10. Build your image
`docker image build -t my-app:1.0 . `

11. Create a `docker-compose.yaml` file  
```
version: '3'
services:
  my-app:
    depends_on:
      - mongodb
    image: my-app:1.0
    ports:
     - 3000:3000
  mongodb:
    image: mongo
    ports:
     - 27017:27017
    environment:
     - MONGO_INITDB_ROOT_USERNAME=admin
     - MONGO_INITDB_ROOT_PASSWORD=password
  mongo-express:
    depends_on:
      - mongodb
    image: mongo-express
    ports:
     - 8081:8081
    environment:
     - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
     - ME_CONFIG_MONGODB_ADMINPASSWORD=password
     - ME_CONFIG_MONGODB_SERVER=mongodb
```

12. Using `docker-compose up -d` command create your containers.  
mongo-express and my-app may get error due to mongodb is not ready. Repeat the `docker-compose up -d` it will fix the error.

13. Go to mongo-express ui `http://localhost:8081` and create a `my-db` databe then `users` collection again.

14. Go to my-app ui `localhost:3000/` see the user profile and play with it.  


