
We can connect to a container's shell like ssh connection a physical or virtual machine.   

## connect running container's shell  
```
[train@localhost miuul]$ docker container exec -it postgresql /bin/bash
root@b6916c4245b8:/#
 ```
exit  

## connect postgresql shell  
 ```
[train@localhost miuul]$ docker container exec -it postgresql psql --username postgres
 ```

`-it` means:  
 `-i, --interactive`  Keep STDIN open even if not attached  
 `-t, --tty` Allocate a pseudo-TTY

 We can use `-it` option when we start or run containers.  
 