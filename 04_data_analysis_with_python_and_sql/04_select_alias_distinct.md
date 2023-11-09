## 1. SELECT

### select all
```
select * from customers limit 5;
```

- Output
```
customer_id|customer_name                     |contact_name      |address                      |city       |postalcode|country|income |
-----------+----------------------------------+------------------+-----------------------------+-----------+----------+-------+-------+
          1|Alfreds Futterkiste               |Maria Anders      |Obere Str. 57                |Berlin     |12209     |Germany|48630.0|
          2|Ana Trujillo Emparedados y helados|Ana Trujillo      |Avda. de la Constitución 2222|México D.F.|05021     |Mexico |21470.0|
          3|Antonio Moreno Taquería           |Antonio Moreno    |Mataderos 2312               |México D.F.|05023     |Mexico |92640.0|
          4|Around the Horn                   |Thomas Hardy      |120 Hanover Sq.              |London     |WA1 1DP   |UK     |76610.0|
          5|Berglunds snabbköp                |Christina Berglund|Berguvsvägen 8               |Luleå      |S-958 22  |Sweden |91220.0|
```

### select a subset of columns 
```
select customer_name, country from customers limit 5;
```

- Output
```
customer_name                     |country|
----------------------------------+-------+
Alfreds Futterkiste               |Germany|
Ana Trujillo Emparedados y helados|Mexico |
Antonio Moreno Taquería           |Mexico |
Around the Horn                   |UK     |
Berglunds snabbköp                |Sweden |
```

## 2. Alias
```
select customer_id as id from customers limit 5;
```

- Output
```
id|
--+
 1|
 2|
 3|
 4|
 5|
```


## 3. Distinct
```
select distinct country from customers ;
```

- Output
```
country    |
-----------+
Argentina  |
Spain      |
Switzerland|
Italy      |
Venezuela  |
Belgium    |
Norway     |
Sweden     |
USA        |
France     |
Mexico     |
Brazil     |
Austria    |
Poland     |
UK         |
Ireland    |
Germany    |
Denmark    |
Canada     |
Finland    |
Portugal   |
```



















