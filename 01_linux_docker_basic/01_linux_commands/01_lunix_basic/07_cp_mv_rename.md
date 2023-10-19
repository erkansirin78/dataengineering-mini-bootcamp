1. `touch` creates new file  
```
[train@localhost play]$ touch myfile1
[train@localhost play]$ echo "inside myfile1" >> myfile1
[train@localhost play]$ echo "inside myfile1" >> myfile1
[train@localhost play]$ echo "inside myfile2" >> myfile2
[train@localhost play]$ echo "inside myfile2 other line" >> myfile2
[train@localhost play]$ ll
total 8
-rw-rw-r--. 1 train train 30 Sep  1 18:37 myfile1
-rw-rw-r--. 1 train train 41 Sep  1 18:38 myfile2
```

2. `mkdir` creates new folder  
```
[train@localhost play]$ mkdir myfolder
[train@localhost play]$ ll
total 8
-rw-rw-r--. 1 train train 30 Sep  1 18:37 myfile1
-rw-rw-r--. 1 train train 41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train  6 Sep  1 18:39 myfolder
```

1. `cp` copies file or folders to specified destination  
```
[train@localhost play]$ cp myfile1 myfolder

[train@localhost play]$ ll
total 8
-rw-rw-r--. 1 train train 30 Sep  1 18:37 myfile1
-rw-rw-r--. 1 train train 41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train 21 Sep  1 18:39 myfolder

[train@localhost play]$ ll myfolder/
total 4
-rw-rw-r--. 1 train train 30 Sep  1 18:39 myfile1
```

2. copy multiple files   
```
[train@localhost play]$ ll
total 8
-rw-rw-r--. 1 train train 30 Sep  1 18:37 myfile1
-rw-rw-r--. 1 train train 41 Sep  1 18:38 myfile2
drwxrwxr-x. 2 train train  6 Sep  1 18:59 myfolder

[train@localhost play]$ cp -r myfile* myfolder/

[train@localhost play]$ ll myfolder/
total 8
-rw-rw-r--. 1 train train 30 Sep  1 18:59 myfile1
-rw-rw-r--. 1 train train 41 Sep  1 18:59 myfile2
```

3. rename while copying ang get info about the result  
```
[train@localhost play]$ cp -v myfile1 myfolder/myfile1_copied
myfile1 -> myfolder/myfile1_copied
```

4. `mv`
```
[train@localhost play]$ mv myfile2 myfolder/

[train@localhost play]$ ll
total 4
-rw-rw-r--. 1 train train 30 Sep  1 18:37 myfile1
drwxrwxr-x. 2 train train 36 Sep  1 18:39 myfolder

[train@localhost play]$ ll myfolder/
total 8
-rw-rw-r--. 1 train train 30 Sep  1 18:39 myfile1
-rw-rw-r--. 1 train train 41 Sep  1 18:38 myfile2
```

We can move multiple files/folders at one command  
`mv file1 file2 file3 destination_folder`

5. rename with `mv`  
```
[train@localhost play]$ ll
-rw-rw-r--. 1 train train       26 Sep  2 10:23 newfile

[train@localhost play]$ mv newfile newfile_renamed

[train@localhost play]$ ll
-rw-rw-r--. 1 train train       26 Sep  2 10:23 newfile_renamed
```