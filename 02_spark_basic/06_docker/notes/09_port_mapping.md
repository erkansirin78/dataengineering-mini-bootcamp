## Stop local postgresql
```
sudo systemctl stop gitea
sudo systemctl stop postgresql-10
```

## Try to reach docker postgresql
```
[train@localhost prod_level]$ psql -h localhost -d train -U postgres
psql: could not connect to server: Connection refused
        Is the server running on host "localhost" (::1) and accepting
        TCP/IP connections on port 5432?
could not connect to server: Connection refused
        Is the server running on host "localhost" (127.0.0.1) and accepting
        TCP/IP connections on port 5432?
```

## Stop and remove postgresql container
```
[train@localhost prod_level]$ docker container stop postgresql

[train@localhost prod_level]$ docker container rm postgresql
```

## Create postgresql container with port mapping
```
[train@localhost prod_level]$  docker run --name postgresql \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=Ankara06 \
-e PGDATA=/var/lib/postgresql/data/pgdata \
-v v_postgresql_10:/var/lib/postgresql/data \
-p 5433:5432 \
-d postgres:10
```

## Connect postgresql from mapped port
```
[train@localhost prod_level]$ psql -h localhost -p 5433 -d train -U postgres


Password for user postgres: Ankara06
psql (9.2.24, server 10.15 (Debian 10.15-1.pgdg90+1))
WARNING: psql version 9.2, server version 10.0.
         Some psql features might not work.
Type "help" for help.
```

## Start local postgresql server
```
[train@localhost prod_level]$ sudo systemctl start postgresql-10
```

## Connect local postgresql server
```
[train@localhost prod_level]$ psql -h localhost -p 5432 -d traindb -U train

Password for user train: Ankara06
psql (9.2.24, server 10.13)
WARNING: psql version 9.2, server version 10.0.
         Some psql features might not work.
Type "help" for help.
```

## Which postgresql instance we have connected? Think about it.
- Local or docker container.
