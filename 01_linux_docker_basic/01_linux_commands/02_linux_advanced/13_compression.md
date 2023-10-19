- Data compression is the process of removing redundancy from data.

## Logic of compression
compress-simulation.sh
```
#!/bin/bash

for i in {1..20};
  do
    echo "$i - These lines are male"
  done

for j in {21..40};
  do
    echo "$j - These lines are female"
  done
```

- `[train@localhost linux]$ ./compress-simulation.sh`  

- Discuss the output.

## `gzip`
- **compresses** and **overwrites** the normal_file  
- `gzip <file>`

```
[train@localhost linux]$ gzip -v /home/train/datasets/Advertising.csv
/home/train/datasets/Advertising.csv:    55.2% -- replaced with /home/train/datasets/Advertising.csv.gz

[train@localhost play]$ ll /home/train/datasets
total 352
-rw-rw-r--. 1 train train   2074 Jul 21 18:58 Advertising.csv.gz
-rw-rw-r--. 1 train train   4611 Sep  1 16:13 iris.csv
-rw-rw-r--. 1 train train  15802 Sep  1 16:13 iris.json
-rw-rw-r--. 1 train train 325145 Sep  1 16:14 kuruyemisler.txt
drwxrwxr-x. 2 train train    133 Jul 23 22:06 retail_db
-rw-rw-r--. 1 train train    148 Sep  1 16:16 simple_text.txt
```

## gunzip
- uncompresses `.gz` extension file
```
[train@localhost play]$ gunzip ~/datasets/Advertising.csv.gz

[train@localhost play]$ ll ~/datasets/
total 356
-rw-rw-r--. 1 train train   4556 Jul 21 18:58 Advertising.csv
-rw-rw-r--. 1 train train   4611 Sep  1 16:13 iris.csv
-rw-rw-r--. 1 train train  15802 Sep  1 16:13 iris.json
-rw-rw-r--. 1 train train 325145 Sep  1 16:14 kuruyemisler.txt
drwxrwxr-x. 2 train train    133 Jul 23 22:06 retail_db
-rw-rw-r--. 1 train train    148 Sep  1 16:16 simple_text.txt
```

## `gzip -c` keep source file
```
[train@localhost play]$ gzip -c /home/train/datasets/Advertising.csv > /home/train/datasets/Advertising.csv.gz

[train@localhost play]$  ll ~/datasets/
total 243684
-rw-rw-r--. 1 train train     4556 Jul 21  2020 Advertising.csv
-rw-rw-r--. 1 train train     2074 Jun 24 23:50 Advertising.csv.gz
```

We compressed and moved .gz file to our current directory.  
 
## `gzip -r` recursively compress used all files in a folder
 ```
[train@localhost play]$ ll /home/train/datasets/retail_db/
total 9328
-rw-rw-r--. 1 train train    1074 Jul 23 22:05 categories.csv
-rw-rw-r--. 1 train train  953847 Jul 23 22:06 customers.csv
-rw-rw-r--. 1 train train      88 Jul 23 22:06 departments.csv
-rw-rw-r--. 1 train train 5408988 Jul 23 22:06 order_items.csv
-rw-rw-r--. 1 train train 2999990 Jul 23 22:06 orders.csv
-rw-rw-r--. 1 train train  174240 Jul 23 22:06 products.csv
```
```
[train@localhost play]$ gzip -r /home/train/datasets/retail_db/
[train@localhost play]$ ll /home/train/datasets/retail_db/
total 1756
-rw-rw-r--. 1 train train     612 Jul 23 22:05 categories.csv.gz
-rw-rw-r--. 1 train train  250493 Jul 23 22:06 customers.csv.gz
-rw-rw-r--. 1 train train     115 Jul 23 22:06 departments.csv.gz
-rw-rw-r--. 1 train train 1031577 Jul 23 22:06 order_items.csv.gz
-rw-rw-r--. 1 train train  471126 Jul 23 22:06 orders.csv.gz
-rw-rw-r--. 1 train train   28136 Jul 23 22:06 products.csv.gz
```


## `gunzip -r` recursively uncompress files 
```
[train@localhost play]$ gunzip -r ~/datasets/retail_db/
[train@localhost play]$ ll /home/train/datasets/retail_db/
total 9328
-rw-rw-r--. 1 train train    1074 Jul 23 22:05 categories.csv
-rw-rw-r--. 1 train train  953847 Jul 23 22:06 customers.csv
-rw-rw-r--. 1 train train      88 Jul 23 22:06 departments.csv
-rw-rw-r--. 1 train train 5408988 Jul 23 22:06 order_items.csv
-rw-rw-r--. 1 train train 2999990 Jul 23 22:06 orders.csv
-rw-rw-r--. 1 train train  174240 Jul 23 22:06 products.csv
```
## zip a file
```
zip Advertising.csv.zip Advertising.csv
  adding: Advertising.csv (deflated 55%)


ll
-rw-rw-r--. 1 train train 4556 Jun 24 23:57 Advertising.csv
-rw-rw-r--. 1 train train 2220 Jun 24 23:57 Advertising.csv.zip
```

## How to extract zip files
```
[train@localhost linux_basic]$ rm Advertising.csv

[train@localhost linux_basic]$ unzip Advertising.csv.zip
Archive:  Advertising.csv.zip
  inflating: Advertising.csv


[train@localhost linux_basic]$ ll
total 20
-rw-rw-r--. 1 train train 4556 Jun 24 23:57 Advertising.csv
-rw-rw-r--. 1 train train 2220 Jun 24 23:57 Advertising.csv.zip
-rw-rw-r--. 1 train train   44 Jun 24 23:35 age_name.txt
-rw-rw-r--. 1 train train   29 Jun 24 23:29 names.txt
```

















