## `>` override the file   
```
[train@localhost play]$ cat myfile1
inside myfile1
inside myfile1
[train@localhost play]$ echo "this will override" > myfile1
[train@localhost play]$ cat myfile1
this will override
```

## `>>` add new line to file   
```
[train@localhost play]$ echo "this will add new line" >> myfile1
[train@localhost play]$ cat myfile1
this will override
this will add new line
```

## `>` can behave like touch   
```
[train@localhost play]$ echo "this will create new file" > newfile
[train@localhost play]$ ll
total 12
-rw-rw-r--. 1 train train 42 Sep  2 10:21 myfile1
-rw-rw-r--. 1 train train 41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train 58 Sep  1 19:05 myfolder
-rw-rw-r--. 1 train train 26 Sep  2 10:23 newfile
[train@localhost play]$ cat newfile
this will create new file
```

## `&>` will direct errors as well  
```
[train@localhost play]$ ls -l mahmut &> mahmutfile
[train@localhost play]$ cat mahmutfile
ls: cannot access mahmut: No such file or directory
```

## cat and EOF usage. We can create and write or append a file easily. 
- Create or overwrite
```
cat <<EOF > filename
line1
line2
line3
EOF 
```

- Append
```
[ansadmin@kmaster1 my_ans_dev]$ cat <<EOF >> filename
This line will be appended
EOF

[ansadmin@kmaster1 my_ans_dev]$ cat print.sh
line1
line2
line3
This line will be appended
```
- Another way to append multiple lines to a file
```
echo "192.168.206.40 kafka-manager.vbo.local  kmanager
192.168.206.41 kafka1.vbo.local kafka1 zookeeper1
192.168.206.42 kafka2.vbo.local kafka2 zookeeper2
192.168.206.43 kafka3.vbo.local kafka3 zookeeper3" | sudo tee --append /etc/hosts
``` 
## < file or input  
```
[train@localhost play]$ cat < hello_netcat.txt
Hello netcat
whats up
```
direction.sh  
```
#! /bin/bash

ls -l mahmut
ls -l /etc | head -n 10
```
## `2>` directs just errors  
```
[train@localhost play]$ ./direction.sh 2> myFile
total 1444
drwxr-xr-x.  3 root root      101 Jul 21 00:01 abrt
-rw-r--r--.  1 root root       16 Jul 21 00:17 adjtime
-rw-r--r--.  1 root root     1529 Apr  1  2020 aliases
-rw-r--r--.  1 root root    12288 Jul 21 02:53 aliases.db
drwxr-xr-x.  3 root root       65 Jul 21 00:06 alsa
drwxr-xr-x.  2 root root     8192 Aug  8 10:16 alternatives
-rw-------.  1 root root      541 Aug  9  2019 anacrontab
-rw-r--r--.  1 root root       55 Aug  8  2019 asound.conf
-rw-r--r--.  1 root root        1 Oct 30  2018 at.deny

[train@localhost play]$ cat myFile
ls: cannot access mahmut: No such file or directory
```

## `&>` directs both output and errors
```
[train@localhost linux]$ cat şakir
ls: cannot access mahmut: No such file or directory
total 1444
drwxr-xr-x.  3 root root      101 Jul 21 00:01 abrt
-rw-r--r--.  1 root root       16 Jul 21 00:17 adjtime
-rw-r--r--.  1 root root     1529 Apr  1  2020 aliases
-rw-r--r--.  1 root root    12288 Jul 21 02:53 aliases.db
drwxr-xr-x.  3 root root       65 Jul 21 00:06 alsa
drwxr-xr-x.  2 root root     8192 Aug  8 10:16 alternatives
-rw-------.  1 root root      541 Aug  9  2019 anacrontab
-rw-r--r--.  1 root root       55 Aug  8  2019 asound.conf
-rw-r--r--.  1 root root        1 Oct 30  2018 at.deny
```

## `&>>` adds output and error

##  `command > şakir 2> hatalı-şakir`  girects output to şakir, errors to hatalı-şakir
```
[train@localhost linux]$ ./direction.sh > şakir 2> hatalı-şakir
[train@localhost linux]$ cat şakir
total 1444
drwxr-xr-x.  3 root root      101 Jul 21 00:01 abrt
-rw-r--r--.  1 root root       16 Jul 21 00:17 adjtime
-rw-r--r--.  1 root root     1529 Apr  1  2020 aliases
-rw-r--r--.  1 root root    12288 Jul 21 02:53 aliases.db
drwxr-xr-x.  3 root root       65 Jul 21 00:06 alsa
drwxr-xr-x.  2 root root     8192 Aug  8 10:16 alternatives
-rw-------.  1 root root      541 Aug  9  2019 anacrontab
-rw-r--r--.  1 root root       55 Aug  8  2019 asound.conf
-rw-r--r--.  1 root root        1 Oct 30  2018 at.deny
[train@localhost linux]$ cat hatalı-şakir
ls: cannot access mahmut: No such file or directory
./direction.sh: line 4: 2/0 : division by 0 (error token is "0 ")
```

## In the shell, what does `2>&1` mean?  
File descriptor 1 is the standard output (stdout).  
File descriptor 2 is the standard error (stderr).

Here is one way to remember this construct (although it is not entirely accurate): at first, `2>1` may look like a good way to redirect stderr to stdout. However, it will actually be interpreted as "redirect stderr to a file named 1". & indicates that what follows and precedes is a file descriptor and not a filename. So the construct becomes: `2>&1`.

Consider `>&` as redirect merger operator.

|      Name      | Short Name | File Descriptor Number |      Description     |
|:--------------:|:----------:|:----------------------:|:--------------------:|
| Standard In    | stdin      | 0                      | Keyboard Input       |
| Standard Out   | stdout     | 1                      | Console Output       |
| Standard Error | stderr     | 2                      | Console Error Output |

- This usage `ls myDir > result.txt 2>&1` is short version of `ls myDir > result.txt 2> result.txt`  
 Our `2>&1` idiom. It means redirect any stderr (2>) to the same place we are redirecting stdout (&1).  
 