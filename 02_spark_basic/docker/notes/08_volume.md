
` docker run --name postgresql -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=Ankara06 -d postgres:10
- Connect to container and create a database. 
```
[train@localhost play]$ docker container exec -it postgresql psql --username postgres
psql (10.14 (Debian 10.14-1.pgdg90+1))
Type "help" for help.

# create database
postgres=# create database train;
CREATE DATABASE
```

- Create a simple table and insert a few recrds in it.
```
postgres=# \c train
You are now connected to database "train" as user "postgres".

train=# create table songs(id int, name varchar(50));
CREATE TABLE
train=# insert into songs values (1, 'Eye of the Tiger'), (2, 'In the Army Now'), (3, 'Billie Jean');
INSERT 0 3
train=# select * from songs;
 id |       name
----+------------------
  1 | Eye of the Tiger
  2 | In the Army Now
  3 | Billie Jean
(3 rows)

train=# \q
```
- remove container  
```
[train@localhost play]$ docker container stop postgresql
postgresql
[train@localhost play]$ docker container rm postgresql
postgresql
```

- recreate container and check if our data is still there.
```
[train@localhost play]$ docker run --name postgresql -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=Ankara06 -d postgres:10
9b6a51228938b330411615b828c87dcec7512981e5227b40d2f6e63e8b263529
[train@localhost play]$ docker container exec -it postgresql psql -U postgres
psql (10.14 (Debian 10.14-1.pgdg90+1))
Type "help" for help.

postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
(3 rows)
```
As you see your data is gone. To solve this problem you need to use a volume.

Stop and remove postgresql container.
```
postgres=# \q
[train@localhost play]$ docker container stop postgresql
postgresql
[train@localhost play]$ docker container rm postgresql
postgresql
```

- Create a volume
```
[train@localhost play]$ docker volume create v_postgresql_10
v_postgresql_10
[train@localhost play]$ docker volume inspect v_postgresql_10
[
    {
        "CreatedAt": "2020-10-30T16:39:19+03:00",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/v_postgresql_10/_data",
        "Name": "v_postgresql_10",
        "Options": {},
        "Scope": "local"
    }
]
```
- Now run the postgresql again attached with volume
```
docker run \
--name postgresql \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=Ankara06 \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-v v_postgresql_10:/var/lib/postgresql/data \
-d \
postgres:10
```

- Create a database, table and some records
```
[train@localhost play]$ docker container exec -it postgresql psql -U postgres                             


postgres=# create database train;

postgres=# \c train

train=#  create table songs(id int, name varchar(50));

train=# insert into songs values (1, 'Eye of the Tiger'), (2, 'In the Army Now'), (3, 'Billie Jean');

train=# select * from songs;
 id |       name
----+------------------
  1 | Eye of the Tiger
  2 | In the Army Now
  3 | Billie Jean


train=# \q

```
- stop  and remove container  
```
[train@localhost play]$ docker container stop postgresql
postgresql
[train@localhost play]$ docker container rm postgresql
postgresql
```

- create postgresql docker again  and see the data is still there.
``` 
[train@localhost play]$ docker run \
--name postgresql \
-e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=Ankara06 \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-v v_postgresql_10:/var/lib/postgresql/data \
-d postgres:10

[train@localhost play]$ docker container exec -it postgresql psql -U postgres


postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 train     | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
(4 rows)

postgres=# \c train
You are now connected to database "train" as user "postgres".
train=# select * from songs;
 id |       name
----+------------------
  1 | Eye of the Tiger
  2 | In the Army Now
  3 | Billie Jean
(3 rows)
```