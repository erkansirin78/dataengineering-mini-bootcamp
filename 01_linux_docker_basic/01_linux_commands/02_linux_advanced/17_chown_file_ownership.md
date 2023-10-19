## change ownership of a file 
```
[train@localhost play]$ sudo chown user1:docker Advertising.csv.gz
[train@localhost play]$ ll
total 1764
-rw-rw-r--. 1 user1 docker    2074 Sep  2 11:04 Advertising.csv.gz
-rw-rw-r--. 1 train train       52 Sep  2 10:25 mahmutfile
-rw-rw-r--. 1 train train       42 Sep  2 10:21 myfile1
-rw-rw-r--. 1 train train       41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train       58 Sep  1 19:05 myfolder
-rw-rw-r--. 1 train train       26 Sep  2 10:23 newfile
drwxrwxr-x. 2 train train      133 Sep  2 12:25 retail_db
-rw-rw-r--. 1 train train  1785696 Sep  2 12:31 retail_db.tar.gz
```

## recursive change -R 
```
[train@localhost play]$ sudo chown user1:docker retail_db (this will change only directory not subfolders)
[train@localhost play]$ ll
total 1764
-rw-rw-r--. 1 user1 docker    2074 Sep  2 11:04 Advertising.csv.gz
-rw-rw-r--. 1 train train       52 Sep  2 10:25 mahmutfile
-rw-rw-r--. 1 train train       42 Sep  2 10:21 myfile1
-rw-rw-r--. 1 train train       41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train       58 Sep  1 19:05 myfolder
-rw-rw-r--. 1 train train       26 Sep  2 10:23 newfile
drwxrwxr-x. 2 user1 docker     133 Sep  2 12:25 retail_db
-rw-rw-r--. 1 train train  1785696 Sep  2 12:31 retail_db.tar.gz

[train@localhost play]$ ll retail_db
total 9328
-rw-rw-r--. 1 train train    1074 Sep  2 12:25 categories.csv
-rw-rw-r--. 1 train train  953847 Sep  2 12:25 customers.csv
-rw-rw-r--. 1 train train      88 Sep  2 12:25 departments.csv
-rw-rw-r--. 1 train train 5408988 Sep  2 12:25 order_items.csv
-rw-rw-r--. 1 train train 2999990 Sep  2 12:25 orders.csv
-rw-rw-r--. 1 train train  174240 Sep  2 12:25 products.csv
```

```
[train@localhost play]$ sudo chown -R user1:docker retail_db (this will change all subfolders)
[train@localhost play]$ ll retail_db
total 9328
-rw-rw-r--. 1 user1 docker    1074 Sep  2 12:25 categories.csv
-rw-rw-r--. 1 user1 docker  953847 Sep  2 12:25 customers.csv
-rw-rw-r--. 1 user1 docker      88 Sep  2 12:25 departments.csv
-rw-rw-r--. 1 user1 docker 5408988 Sep  2 12:25 order_items.csv
-rw-rw-r--. 1 user1 docker 2999990 Sep  2 12:25 orders.csv
-rw-rw-r--. 1 user1 docker  174240 Sep  2 12:25 products.csv
```