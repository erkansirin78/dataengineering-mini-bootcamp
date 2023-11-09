ORDER BY, ASC, DESC

## 1. ASC (Default)

### Sort customers by country
```
select * from customers 
order by country limit 10;
```

- Output
```
customer_id|customer_name             |contact_name    |address                            |city          |postalcode|country  |income |
-----------+--------------------------+----------------+-----------------------------------+--------------+----------+---------+-------+
         54|Océano Atlántico Ltda.    |Yvonne Moncada  |Ing. Gustavo Moncada 8585 Piso 20-A|Buenos Aires  |1010      |Argentina|29270.0|
         64|Rancho grande             |Sergio Gutiérrez|Av. del Libertador 900             |Buenos Aires  |1010      |Argentina|62490.0|
         12|Cactus Comidas para llevar|Patricio Simpson|Cerrito 333                        |Buenos Aires  |1010      |Argentina|22560.0|
         59|Piccolo und mehr          |Georg Pipps     |Geislweg 14                        |Salzburg      |5020      |Austria  |11550.0|
         20|Ernst Handel              |Roland Mendel   |Kirchgasse 6                       |Graz          |8010      |Austria  |11140.0|
         50|Maison Dewey              |Catherine Dewey |Rue Joseph-Bens 532                |Bruxelles     |B-1180    |Belgium  |72860.0|
         76|Suprêmes délices          |Pascale Cartrain|Boulevard Tirou, 255               |Charleroi     |B-6000    |Belgium  |31230.0|
         34|Hanari Carnes             |Mario Pontes    |Rua do Paço, 67                    |Rio de Janeiro|05454-876 |Brazil   |39830.0|
         15|Comércio Mineiro          |Pedro Afonso    |Av. dos Lusíadas, 23               |São Paulo     |05432-043 |Brazil   |35500.0|
         31|Gourmet Lanchonetes       |André Fonseca   |Av. Brasil, 442                    |Campinas      |04876-786 |Brazil   |25990.0|
```


## 2. DESC

### Sort customers by country reverse
```
select * from customers 
order by country desc limit 10;
```

- Output
```
customer_id|customer_name             |contact_name    |address                                       |city           |postalcode|country  |income |
-----------+--------------------------+----------------+----------------------------------------------+---------------+----------+---------+-------+
         46|LILA-Supermercado         |Carlos González |Carrera 52 con Ave. Bolívar #65-98 Llano Largo|Barquisimeto   |3508      |Venezuela|94030.0|
         47|LINO-Delicateses          |Felipe Izquierdo|Ave. 5 de Mayo Porlamar                       |I. de Margarita|4980      |Venezuela|20950.0|
         33|GROSELLA-Restaurante      |Manuel Pereira  |5ª Ave. Los Palos Grandes                     |Caracas        |1081      |Venezuela|27750.0|
         35|HILARIÓN-Abastos          |Carlos Hernández|Carrera 22 con Ave. Carlos Soublette #8-35    |San Cristóbal  |5022      |Venezuela|86120.0|
         48|Lonesome Pine Restaurant  |Fran Wilson     |89 Chiaroscuro Rd.                            |Portland       |97219     |USA      |90470.0|
         36|Hungry Coyote Import Store|Yoshi Latimer   |City Center Plaza 516 Main St.                |Elgin          |97827     |USA      |63240.0|
         45|Let's Stop N Shop         |Jaime Yorres    |87 Polk St. Suite 5                           |San Francisco  |94117     |USA      |73380.0|
         32|Great Lakes Food Market   |Howard Snyder   |2732 Baker Blvd.                              |Eugene         |97403     |USA      |26010.0|
         43|Lazy K Kountry Store      |John Steel      |12 Orchestra Terrace                          |Walla Walla    |99362     |USA      |35990.0|
         55|Old World Delicatessen    |Rene Phillips   |2743 Bering St.                               |Anchorage      |99508     |USA      |56640.0|
```



## 3. ORDER BY Several Columns
### Sort countries and cities
```
select * from customers 
order by country, city limit 10;
```
- Output
```
customer_id|customer_name             |contact_name    |address                            |city          |postalcode|country  |income |
-----------+--------------------------+----------------+-----------------------------------+--------------+----------+---------+-------+
         64|Rancho grande             |Sergio Gutiérrez|Av. del Libertador 900             |Buenos Aires  |1010      |Argentina|62490.0|
         54|Océano Atlántico Ltda.    |Yvonne Moncada  |Ing. Gustavo Moncada 8585 Piso 20-A|Buenos Aires  |1010      |Argentina|29270.0|
         12|Cactus Comidas para llevar|Patricio Simpson|Cerrito 333                        |Buenos Aires  |1010      |Argentina|22560.0|
         20|Ernst Handel              |Roland Mendel   |Kirchgasse 6                       |Graz          |8010      |Austria  |11140.0|
         59|Piccolo und mehr          |Georg Pipps     |Geislweg 14                        |Salzburg      |5020      |Austria  |11550.0|
         50|Maison Dewey              |Catherine Dewey |Rue Joseph-Bens 532                |Bruxelles     |B-1180    |Belgium  |72860.0|
         76|Suprêmes délices          |Pascale Cartrain|Boulevard Tirou, 255               |Charleroi     |B-6000    |Belgium  |31230.0|
         31|Gourmet Lanchonetes       |André Fonseca   |Av. Brasil, 442                    |Campinas      |04876-786 |Brazil   |25990.0|
         88|Wellington Importadora    |Paula Parente   |Rua do Mercado, 12                 |Resende       |08737-363 |Brazil   |44930.0|
         34|Hanari Carnes             |Mario Pontes    |Rua do Paço, 67                    |Rio de Janeiro|05454-876 |Brazil   |39830.0|
```
















