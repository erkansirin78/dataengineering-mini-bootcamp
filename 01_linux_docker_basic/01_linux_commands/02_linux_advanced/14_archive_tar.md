- Usage: ` tar [OPTION...] [FILE]... `  
- GNU `tar` saves many files together into a single tape or disk archive, and can restore individual files from the archive. 
- The tar program is the **classic tool for archiving files**. Its name, short for tape archive, reveals its roots as a tool
for making backup tapes.

## There is no untar.  

- To extract files use `-x` 
- To archive files use `-c`  

## Examples:
```
  tar -cf archive.tar foo bar  # Create archive.tar from files foo and bar.
  tar -tvf archive.tar         # List all files in archive.tar verbosely.
  tar -xf archive.tar          # Extract all files from archive.tar.
```

```
[train@localhost play]$ cp -r ~/datasets/retail_db .
[train@localhost play]$ ll
total 20
-rw-rw-r--. 1 train train 2074 Sep  2 11:04 Advertising.csv.gz
-rw-rw-r--. 1 train train   52 Sep  2 10:25 mahmutfile
-rw-rw-r--. 1 train train   42 Sep  2 10:21 myfile1
-rw-rw-r--. 1 train train   41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train   58 Sep  1 19:05 myfolder
-rw-rw-r--. 1 train train   26 Sep  2 10:23 newfile
drwxrwxr-x. 2 train train  133 Sep  2 12:25 retail_db
```

## create a tar file 
```
[train@localhost play]$ tar -cf retail_db.tar retail_db

[train@localhost play]$ ll
total 9352
-rw-rw-r--. 1 train train    2074 Sep  2 11:04 Advertising.csv.gz
-rw-rw-r--. 1 train train      52 Sep  2 10:25 mahmutfile
-rw-rw-r--. 1 train train      42 Sep  2 10:21 myfile1
-rw-rw-r--. 1 train train      41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train      58 Sep  1 19:05 myfolder
-rw-rw-r--. 1 train train      26 Sep  2 10:23 newfile
drwxrwxr-x. 2 train train     133 Sep  2 12:25 retail_db
-rw-rw-r--. 1 train train 9553920 Sep  2 12:25 retail_db.tar
```

## list inside tar file
```
[train@localhost play]$ tar -tvf retail_db.tar
drwxrwxr-x train/train       0 2020-09-02 12:25 retail_db/
-rw-rw-r-- train/train    1074 2020-09-02 12:25 retail_db/categories.csv
-rw-rw-r-- train/train  953847 2020-09-02 12:25 retail_db/customers.csv
-rw-rw-r-- train/train      88 2020-09-02 12:25 retail_db/departments.csv
-rw-rw-r-- train/train 5408988 2020-09-02 12:25 retail_db/order_items.csv
-rw-rw-r-- train/train 2999990 2020-09-02 12:25 retail_db/orders.csv
-rw-rw-r-- train/train  174240 2020-09-02 12:25 retail_db/products.csv
```

## Extract files from tar
```
[train@localhost play]$ rm -rf retail_db

[train@localhost play]$ tar -xf retail_db.tar

[train@localhost play]$ ll
total 9352
-rw-rw-r--. 1 train train    2074 Sep  2 11:04 Advertising.csv.gz
-rw-rw-r--. 1 train train      52 Sep  2 10:25 mahmutfile
-rw-rw-r--. 1 train train      42 Sep  2 10:21 myfile1
-rw-rw-r--. 1 train train      41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train      58 Sep  1 19:05 myfolder
-rw-rw-r--. 1 train train      26 Sep  2 10:23 newfile
drwxrwxr-x. 2 train train     133 Sep  2 12:25 retail_db
-rw-rw-r--. 1 train train 9553920 Sep  2 12:25 retail_db.tar
```


## tar with gzip
```
[train@localhost play]$ tar -czf retail_db.tar.gz retail_db

[train@localhost play]$ ll
total 1764
-rw-rw-r--. 1 train train    2074 Sep  2 11:04 Advertising.csv.gz
-rw-rw-r--. 1 train train      52 Sep  2 10:25 mahmutfile
-rw-rw-r--. 1 train train      42 Sep  2 10:21 myfile1
-rw-rw-r--. 1 train train      41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train      58 Sep  1 19:05 myfolder
-rw-rw-r--. 1 train train      26 Sep  2 10:23 newfile
drwxrwxr-x. 2 train train     133 Sep  2 12:25 retail_db
-rw-rw-r--. 1 train train 1785696 Sep  2 12:31 retail_db.tar.gz

[train@localhost play]$ tar -tvzf retail_db.tar.gz
drwxrwxr-x train/train       0 2020-09-02 12:25 retail_db/
-rw-rw-r-- train/train    1074 2020-09-02 12:25 retail_db/categories.csv
-rw-rw-r-- train/train  953847 2020-09-02 12:25 retail_db/customers.csv
-rw-rw-r-- train/train      88 2020-09-02 12:25 retail_db/departments.csv
-rw-rw-r-- train/train 5408988 2020-09-02 12:25 retail_db/order_items.csv
-rw-rw-r-- train/train 2999990 2020-09-02 12:25 retail_db/orders.csv
-rw-rw-r-- train/train  174240 2020-09-02 12:25 retail_db/products.csv
```

## untar gzipped tar files .tar.gz extension
```
[train@localhost play]$ tar -xzf retail_db.tar.gz

[train@localhost play]$ ll
total 1764
-rw-rw-r--. 1 train train    2074 Sep  2 11:04 Advertising.csv.gz
-rw-rw-r--. 1 train train      52 Sep  2 10:25 mahmutfile
-rw-rw-r--. 1 train train      42 Sep  2 10:21 myfile1
-rw-rw-r--. 1 train train      41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train      58 Sep  1 19:05 myfolder
-rw-rw-r--. 1 train train      26 Sep  2 10:23 newfile
drwxrwxr-x. 2 train train     133 Sep  2 12:25 retail_db
-rw-rw-r--. 1 train train 1785696 Sep  2 12:31 retail_db.tar.gz
```