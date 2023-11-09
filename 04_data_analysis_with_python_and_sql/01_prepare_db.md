## Run docker compose
### Create database, user and give privileges
#### Open psql  
` docker exec -it postgresql psql -U postgres `

#### Create and grant
```
create database traindb;
create user train with encrypted password 'Ankara06';
grant all privileges on database traindb to train;
 \c traindb
traindb=# grant all privileges on schema public TO train;
\q
```

## Run Jupyter Lab
```commandline
docker exec -it spark bash

jupyter lab --ip 0.0.0.0 --port 8888 --allow-root
```
- Copy url like http://127.0.0.1:8888/lab?token=c311d5beb4a8febfe755b34f791efd4788655f417d4f8065
- Paste to browser