
# awk -  pattern scanning and processing 

## Format
` awk OPTIONS file `

## Get all users
### seperate with : and select first column
```
[train@localhost play]$ cat /etc/passwd | awk -F ":" '{print $1}'
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
operator
games
ftp
...
...
```

## Select first columns of simple_data.csv
```
[train@localhost play]$  awk -F "," '{print $1}' ~/datasets/simple_data.csv
sirano
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
16
```


## select 2. and 6. cols separating - 
```
[train@localhost play]$ awk -F "," '{print $2" - "$6}' ~/datasets/simple_data.csv
isim - aylik_gelir
Cemal - 3500
Ceyda - 4200
Timur - 9000
Burcu - 4200
Yasemin - 4800
Ali - 4250
Dilek - 7300
Murat - 12000
Ahmet - 18000
Muhittin - 12000
Hicaziye - 4800
Harun - 4200
Hakkı - 3750
Gülizar - 14250
Şehmuz - 8700
Gençay - 8800
Gençay - 8800
```


## Remove duplicate names
- select names
```
[train@localhost play]$ awk -F "," '{print $2}' ~/datasets/simple_data.csv
isim
Cemal
Ceyda
Timur
Burcu
Yasemin
Ali
Dilek
Murat
Ahmet
Muhittin
Hicaziye
Harun
Hakkı
Gülizar
Şehmuz
Gençay
Gençay
```

- remove duplicates
```
[train@localhost play]$ awk -F "," '{print $2}' ~/datasets/simple_data.csv | uniq
isim
Cemal
Ceyda
Timur
Burcu
Yasemin
Ali
Dilek
Murat
Ahmet
Muhittin
Hicaziye
Harun
Hakkı
Gülizar
Şehmuz
Gençay
```

- print distinct Species 
```
awk -F "," '{print $NF}' ~/data-generator/input/iris.csv | uniq | grep -v Species
Iris-setosa
Iris-versicolor
Iris-virginica
```

