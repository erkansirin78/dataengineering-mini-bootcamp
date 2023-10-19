```
[train@localhost play]$ ls -l
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

## Explanation  
- `d` directory, `-` regular file, `l` A symbolic link.
- r read
- w write
- x execute

- After initial character 
	- first triple is for user, 
	- second triple is for group and 
	- last triple is for others/everyone.

```
[train@localhost play]$ nano runHello.sh
put inside

echo "Hello world"
cwd=$(pwd)
echo "Current directory: $cwd"


[train@localhost play]$ ll
-rw-rw-r--. 1 train train       61 Sep  2 16:08 runHello.sh
```

## make a file executable
```
[train@localhost play]$ ./runHello.sh
-bash: ./runHello.sh: Permission denied


[train@localhost play]$ sudo chmod +x runHello.sh

[train@localhost play]$ ./runHello.sh
Hello world
Current directory: /home/train/production_level_ds/linux_basic/play
```

## use symbols to modify access rights 
``` 
u	user owner  
g	group owner  
o 	others  
a 	all  

+	add  
=	specify the exact permission  
-	remove  
```

## Give user execute right
```
 [train@localhost play]$ ll

-rw-rw-r--. 1 train train       52 Sep  2 10:25 mahmutfile


[train@localhost play]$ sudo chmod u+x mahmutfile

[train@localhost play]$ ll

-rwxrw-r--. 1 train train       52 Sep  2 10:25 mahmutfile
```

## give group execute right
```
[train@localhost play]$ sudo chmod g+x mahmutfile
[train@localhost play]$ ll

-rwxrwxr--. 1 train train       52 Sep  2 10:25 mahmutfile
```

## remove read rights from all
```
[train@localhost play]$ sudo chmod a-r mahmutfile
[train@localhost play]$ ll

--wx-wx---. 1 train train       52 Sep  2 10:25 mahmutfile
```

## Modify all three right at once
```
Remove all rights from user 
[train@localhost play]$ sudo chmod u=--- mahmutfile

-----wx---. 1 train train       52 Sep  2 10:25 mahmutfile
```

## add read and write to user
```
[train@localhost play]$ sudo chmod u=rw- mahmutfile
[train@localhost play]$ ll

-rw--wx---. 1 train train       52 Sep  2 10:25 mahmutfile
```

## Using octals (Follows binary logic)
```
  octal  symbol equivalent 
0 (000)		---
1 (001)		--x
2 (010)		-w-
3 (011)		-wx
4 (100)		r--
5 (101)		r-x
6 (110)		rw- 
7 (111)		rwx
```

## Remove all rights with octal notation
```
[train@localhost play]$ sudo chmod 000 mahmutfile

[train@localhost play]$ ll

----------. 1 train train       52 Sep  2 10:25 mahmutfile
```
## Give user full right
```
train@localhost play]$ sudo chmod 700 mahmutfile
[train@localhost play]$ ll

-rwx------. 1 train train       52 Sep  2 10:25 mahmutfile
```
## Give user and group read and write
```
[train@localhost play]$ sudo chmod 660 mahmutfile
[train@localhost play]$ ll

-rw-rw----. 1 train train       52 Sep  2 10:25 mahmutfile
```