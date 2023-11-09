
## List available databases
```
docker exec -it postgresql psql -d postgres -U postgres
 
postgres-# \l
```
- Exit `\q`

## Connection options
```
Connection options:
  -h, --host=HOSTNAME      database server host or socket directory (default: "local socket")
  -p, --port=PORT          database server port (default: "5432")
  -U, --username=USERNAME  database user name (default: "train")
  -w, --no-password        never prompt for password
  -W, --password           force password prompt (should happen automatically)
  -d  --database 			database 
```

- Example connection to `traindb` database
```
docker exec -it postgresql psql -h localhost -p 5432 -U train -d traindb -W
```
- list tables on selected database
```
traindb=> \dt
```
- describe table 
```
SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = '<table_name>';
```

## Insert csv file into table
- Open new session and connect to container bash
```commandline
docker exec -it postgresql bash
```
- Create a csv file
```
root@fc2dcc95065e:/#  cat<<EOF > users.txt
id,name,age
1,Murat,33
2,Aslı,45
3,Tarık,23
4,Cemalettin,32
5,Serap,29
EOF
```

- Create table from psql
```
traindb=> create table users(id int, name varchar(30), age int);
\q
```
- Copy data from bash container
```
root@fc2dcc95065e:/# psql -d traindb -U train -c "\copy users FROM '/users.txt' DELIMITERS ',' CSV HEADER;"
```

- query users table from psql container 
```
traindb=>  select * from users;
 id |    name    | age
----+------------+-----
  1 | Murat      |  33
  2 | Aslı       |  45
  3 | Tarık      |  23
  4 | Cemalettin |  32
  5 | Serap      |  29
(5 rows)

```