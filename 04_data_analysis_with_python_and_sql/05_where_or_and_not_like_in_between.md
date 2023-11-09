WHERE, AND, OR, NOT, LIKE, IN, BETWEEN

## 1. WHERE

### Customers from Germany
```
SELECT * FROM customers
WHERE Country='Germany';
```

- Output
```
customer_id|customer_name            |contact_name       |address           |city          |postalcode|country|income |
-----------+-------------------------+-------------------+------------------+--------------+----------+-------+-------+
          1|Alfreds Futterkiste      |Maria Anders       |Obere Str. 57     |Berlin        |12209     |Germany|48630.0|
          6|Blauer See Delikatessen  |Hanna Moos         |Forsterstr. 57    |Mannheim      |68306     |Germany|16410.0|
         17|Drachenblut Delikatessend|Sven Ottlieb       |Walserweg 21      |Aachen        |52066     |Germany|60520.0|
         25|Frankenversand           |Peter Franken      |Berliner Platz 43 |München       |80805     |Germany|69370.0|
         39|Königlich Essen          |Philip Cramer      |Maubelstr. 90     |Brandenburg   |14776     |Germany|66390.0|
         44|Lehmanns Marktstand      |Renate Messner     |Magazinweg 7      |Frankfurt a.M.|60528     |Germany|29170.0|
         52|Morgenstern Gesundkost   |Alexander Feuer    |Heerstr. 22       |Leipzig       |04179     |Germany|16220.0|
         56|Ottilies Käseladen       |Henriette Pfalzheim|Mehrheimerstr. 369|Köln          |50739     |Germany|96710.0|
         63|QUICK-Stop               |Horst Kloss        |Taucherstraße 10  |Cunewalde     |01307     |Germany|94780.0|
         79|Toms Spezialitäten       |Karin Josephs      |Luisenstr. 48     |Münster       |44087     |Germany|38390.0|
         86|Die Wandernde Kuh        |Rita Müller        |Adenauerallee 900 |Stuttgart     |70563     |Germany|74300.0|
```

### Operators in The WHERE Clause
```
=	    Equal	
>	    Greater than	
<	    Less than	
>=	    Greater than or equal	
<=	    Less than or equal	
<>	    Not equal. Note: In some versions of SQL this operator may be written as !=	
BETWEEN	Between a certain range	
LIKE	Search for a pattern	
IN	    To specify multiple possible values for a column
```

## 2. AND

### country France and city Strasbourg
```
SELECT * FROM customers
where country = 'France' and city = 'Strasbourg';
```

- Output
```
customer_id|customer_name       |contact_name      |address         |city      |postalcode|country|income |
-----------+--------------------+------------------+----------------+----------+----------+-------+-------+
          7|Blondel père et fils|Frédérique Citeaux|24, place Kléber|Strasbourg|67000     |France |26220.0|
```


## 3. OR
### country France or city Strasbourg
```
SELECT * FROM customers
where country = 'France' or city = 'Strasbourg';
```

- Output
```
customer_id|customer_name            |contact_name      |address                     |city      |postalcode|country|income |
-----------+-------------------------+------------------+----------------------------+----------+----------+-------+-------+
          7|Blondel père et fils     |Frédérique Citeaux|24, place Kléber            |Strasbourg|67000     |France |26220.0|
          9|Bon app'                 |Laurence Lebihans |12, rue des Bouchers        |Marseille |13008     |France |20200.0|
         18|Du monde entier          |Janine Labrune    |67, rue des Cinquante Otages|Nantes    |44000     |France |52700.0|
         23|Folies gourmandes        |Martine Rancé     |184, chaussée de Tournai    |Lille     |59000     |France |91600.0|
         26|France restauration      |Carine Schmitt    |54, rue Royale              |Nantes    |44000     |France |28830.0|
         40|La corne d'abondance     |Daniel Tonini     |67, avenue de l'Europe      |Versailles|78000     |France |71990.0|
         41|La maison d'Asie         |Annette Roulet    |1 rue Alsace-Lorraine       |Toulouse  |31000     |France |84460.0|
         57|Paris spécialités        |Marie Bertrand    |265, boulevard Charonne     |Paris     |75012     |France |57170.0|
         74|Spécialités du monde     |Dominique Perrier |25, rue Lauriston           |Paris     |75016     |France |66180.0|
         84|Victuailles en stock     |Mary Saveley      |2, rue du Commerce          |Lyon      |69004     |France |81820.0|
         85|Vins et alcools Chevalier|Paul Henriot      |59 rue de l'Abbaye          |Reims     |51100     |France |97090.0|
```


## 4. NOT
### Customers except from Germany
```
SELECT * FROM customers
WHERE NOT country='Germany';
```


## 5. NOT, AND, OR together
### Customers from France or Spain but not in Madrid
```
select * from customers 
where (country = 'France' or country = 'Spain') and not city = 'Madrid' ;
```
- Output
```
customer_id|customer_name            |contact_name      |address                     |city      |postalcode|country|income |
-----------+-------------------------+------------------+----------------------------+----------+----------+-------+-------+
          7|Blondel père et fils     |Frédérique Citeaux|24, place Kléber            |Strasbourg|67000     |France |26220.0|
          9|Bon app'                 |Laurence Lebihans |12, rue des Bouchers        |Marseille |13008     |France |20200.0|
         18|Du monde entier          |Janine Labrune    |67, rue des Cinquante Otages|Nantes    |44000     |France |52700.0|
         23|Folies gourmandes        |Martine Rancé     |184, chaussée de Tournai    |Lille     |59000     |France |91600.0|
         26|France restauration      |Carine Schmitt    |54, rue Royale              |Nantes    |44000     |France |28830.0|
         29|Galería del gastrónomo   |Eduardo Saavedra  |Rambla de Cataluña, 23      |Barcelona |08022     |Spain  |73110.0|
         30|Godos Cocina Típica      |José Pedro Freyre |C/ Romero, 33               |Sevilla   |41101     |Spain  |85480.0|
         40|La corne d'abondance     |Daniel Tonini     |67, avenue de l'Europe      |Versailles|78000     |France |71990.0|
         41|La maison d'Asie         |Annette Roulet    |1 rue Alsace-Lorraine       |Toulouse  |31000     |France |84460.0|
         57|Paris spécialités        |Marie Bertrand    |265, boulevard Charonne     |Paris     |75012     |France |57170.0|
         74|Spécialités du monde     |Dominique Perrier |25, rue Lauriston           |Paris     |75016     |France |66180.0|
         84|Victuailles en stock     |Mary Saveley      |2, rue du Commerce          |Lyon      |69004     |France |81820.0|
         85|Vins et alcools Chevalier|Paul Henriot      |59 rue de l'Abbaye          |Reims     |51100     |France |97090.0|
```


## 6. LIKE
### Contact name starts with A
```
select * from customers 
where contact_name like 'A%';
```
- Output
```
customer_id|customer_name                     |contact_name      |address                      |city       |postalcode|country|income |
-----------+----------------------------------+------------------+-----------------------------+-----------+----------+-------+-------+
          2|Ana Trujillo Emparedados y helados|Ana Trujillo      |Avda. de la Constitución 2222|México D.F.|05021     |Mexico |21470.0|
          3|Antonio Moreno Taquería           |Antonio Moreno    |Mataderos 2312               |México D.F.|05023     |Mexico |92640.0|
         19|Eastern Connection                |Ann Devon         |35 King George               |London     |WX3 6FW   |UK     |59230.0|
         21|Familia Arquibaldo                |Aria Cruz         |Rua Orós, 92                 |São Paulo  |05442-030 |Brazil |75570.0|
         31|Gourmet Lanchonetes               |André Fonseca     |Av. Brasil, 442              |Campinas   |04876-786 |Brazil |25990.0|
         41|La maison d'Asie                  |Annette Roulet    |1 rue Alsace-Lorraine        |Toulouse   |31000     |France |84460.0|
         52|Morgenstern Gesundkost            |Alexander Feuer   |Heerstr. 22                  |Leipzig    |04179     |Germany|16220.0|
         69|Romero y tomillo                  |Alejandra Camino  |Gran Vía, 1                  |Madrid     |28001     |Spain  |87010.0|
         75|Split Rail Beer & Ale             |Art Braunschweiger|P.O. Box 555                 |Lander     |82520     |USA    |44520.0|
         81|Tradição Hipermercados            |Anabela Domingues |Av. Inês de Castro, 414      |São Paulo  |05634-030 |Brazil |65300.0|
```



## 7. IN
### Customers from countries France, Germany and UK
```
select  customer_name, country from customers 
where country in ('Germany', 'France', 'UK') limit 5;
```
- Output
```
customer_name          |country|
-----------------------+-------+
Alfreds Futterkiste    |Germany|
Around the Horn        |UK     |
Blauer See Delikatessen|Germany|
Blondel père et fils   |France |
Bon app'               |France |
```


## 8. BETWEEN
### Customers from countries France, Germany and UK
```
select  customer_name, country, income from customers 
where income between 10000 and 20000;
```
- Output
```
customer_name               |country|income |
----------------------------+-------+-------+
Blauer See Delikatessen     |Germany|16410.0|
Ernst Handel                |Austria|11140.0|
Magazzini Alimentari Riuniti|Italy  |19010.0|
Morgenstern Gesundkost      |Germany|16220.0|
Piccolo und mehr            |Austria|11550.0|
Reggiani Caseifici          |Italy  |17570.0|
Tortuga Restaurante         |Mexico |16070.0|
```







