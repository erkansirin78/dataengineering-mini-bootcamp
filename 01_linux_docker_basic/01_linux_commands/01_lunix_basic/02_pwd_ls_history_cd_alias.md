# pwd  
print current directory
```
[train@localhost play]$ pwd
/home/train/production_level_ds/linux_basic/play
```

#  ls
list file and folders

Some important ls arguments  
- ls -l  regular and alphabethical order  
- ls -r sort reverse order by file name 
- ls -S sort by file size
- ls -t sort by time
- ls -lh make human readable (size)
- ls -a show hiddens

-h human readable  
```
[train@localhost play]$ ls -lh
total 1.8M
-rw-rw-r--. 1 user1 docker 2.1K Sep  2 11:04 Advertising.csv.gz
-rw-rw----. 1 train train    52 Sep  2 10:25 mahmutfile
-rw-rw-r--. 1 train train    42 Sep  2 10:21 myfile1
-rw-rw-r--. 1 train train    41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train    58 Sep  1 19:05 myfolder
-rw-rw-r--. 1 train train    26 Sep  2 10:23 newfile
drwxrwxr-x. 2 user1 docker  133 Sep  2 12:25 retail_db
-rw-rw-r--. 1 train train  1.8M Sep  2 12:31 retail_db.tar.gz
-rwxrwxr-x. 1 train train    61 Sep  2 16:08 runHello.sh
```

# history  
lists commands executed in the past  

list last ten command  
```
[train@localhost play]$ history 10
  450  pwd
  451  cd linux_basic/play/
  452  pwd
  453  ls -
  454  ls -l
  455  ls -h
  456  ls -lh
  457  man history
  458  history -n 10
  459  history 10
  ```

  `history -c` deletes all history

 # cd
  Change directory

1. `cd ..`     move one level upper directory  
2. `cd ../..`  move two level upper directory  
3. `cd ~`      move to home directory  
4. `cd /`      move to root directory  

# file
file command tells us type of file/directory
```
[train@localhost ~]$ file Documents
Documents: directory
[train@localhost ~]$ file mlflow_server.log
mlflow_server.log: ASCII text
[train@localhost ~]$ file show_folder_size.sh
show_folder_size.sh: Bourne-Again shell script, ASCII text executable
```

# alias 
```
[train@localhost play]$ alias doco="docker container"

[train@localhost play]$ doco ls
CONTAINER ID        IMAGE                 COMMAND                  CREATED             STATUS              PORTS                                                       NAMES

```
# constant alias
alias will be removed with session. If you need a constant alias you need to edit ~/.bashrc file
```
[train@localhost play]$ nano ~/.bashrc
```
add alias command to file and save it after that enter source command
```
[train@localhost play]$ source ~/.bashrc
```



