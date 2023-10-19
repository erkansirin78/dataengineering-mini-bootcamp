# Create file - touch
```
[train@localhost play]$ touch my_file
[train@localhost play]$ ls -l
total 0
-rw-rw-r--. 1 train train 0 Sep  1 16:41 my_file
```

# Create directory/folder - mkdir

# Remove - rm
- `rm` delete file/folder  
```
[train@localhost play]$ rm my_file
[train@localhost play]$ ls -l
total 0
```
popular parameters of rm   
-f force   
-r recursive  
```
[train@localhost play]$ rm myfolder/
rm: cannot remove �myfolder/�: Is a directory

[train@localhost play]$ rm -r myfolder
[train@localhost play]$ ll
```
## Remove all excluding one/some
- Existing files and folders
```
[ansadmin@utility templates]$ ls -l
total 32
-rw-rw-r-- 1 ansadmin ansadmin  117 Aug 24 11:00 configmap.yaml
-rw-r--r-- 1 ansadmin ansadmin 1836 Aug 24 11:00 deployment.yaml
-rw-r--r-- 1 ansadmin ansadmin 1782 Aug 24 11:00 _helpers.tpl
-rw-r--r-- 1 ansadmin ansadmin  916 Aug 24 11:00 hpa.yaml
-rw-r--r-- 1 ansadmin ansadmin 1056 Aug 24 11:00 ingress.yaml
-rw-r--r-- 1 ansadmin ansadmin 1747 Aug 24 11:00 NOTES.txt
-rw-r--r-- 1 ansadmin ansadmin  320 Aug 24 11:00 serviceaccount.yaml
-rw-r--r-- 1 ansadmin ansadmin  361 Aug 24 11:00 service.yaml
drwxr-xr-x 2 ansadmin ansadmin   34 Aug 24 11:00 tests
```
- We want to delete all files except configmap.yaml

- Enable  extended pattern matching operators 
```
[ansadmin@utility templates]$ shopt -s extglob
```
- delete all files except configmap.yaml
```
[ansadmin@utility templates]$ rm -vr !("configmap.yaml")
removed ‘deployment.yaml’
removed ‘_helpers.tpl’
removed ‘hpa.yaml’
removed ‘ingress.yaml’
removed ‘NOTES.txt’
removed ‘serviceaccount.yaml’
removed ‘service.yaml’
removed ‘tests/test-connection.yaml’
removed directory: ‘tests’
```
- Check result
```
[ansadmin@utility templates]$ ls -l
total 4
-rw-rw-r-- 1 ansadmin ansadmin 117 Aug 24 11:00 configmap.yaml
```

- If you want to exclude one than more
` rm -vr !("configmap.yaml|file2|file3")