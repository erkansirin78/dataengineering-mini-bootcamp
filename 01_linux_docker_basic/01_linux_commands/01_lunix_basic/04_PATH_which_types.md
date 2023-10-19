1. Commands  are grouped into two categories:  

**Internal Commands :** Commands which are built into the shell. For all the shell built-in commands, execution of the same is fast in the sense that the shell doesn’t have to search the given path for them in the PATH variable, and also no process needs to be spawned for executing it.  
Examples: `source, cd, fg` , etc.

**External Commands :** Commands which aren’t built into the shell. When an external command has to be executed, the shell looks for its path given in the PATH variable, and also a new process has to be spawned and the command gets executed. They are usually located in /bin or /usr/bin. For example, when you execute the “cat” command, which usually is at /usr/bin, the executable /usr/bin/cat gets executed.  
Examples: `ls, cat` , etc.

2. How to distinguish internal and external command  
`type <command>`

Example:  
```
[train@localhost play]$ type cd
cd is a shell builtin
[train@localhost play]$ type nano
nano is hashed (/usr/bin/nano)
```

3. External commands searched in PATH variable   
```
[train@localhost play]$ echo $PATH
/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/train/.local/bin:/home/train/bin:
/usr/lib/jvm/java-1.8.0-openjdk//bin:/opt/manual/kafka//bin:/opt/manual/hadoop//bin:/opt/manual/hadoop//sbin:
/opt/manual/hive//bin:/opt/manual/sqoop//bin:/opt/manual/spark//bin:/opt/manual/maven//bin:
/opt/manual/intellij//bin:/opt/manual/pycharm//bin
```
in PATH there are only directories.  


4. `which` tells us commands binary folder  
```
[train@localhost play]$ which nano
/usr/bin/nano
[train@localhost play]$ which python3
/usr/bin/python3
[train@localhost play]$ which python
/usr/bin/python
```

5. Adding new folders to PATH
`export PATH="your-dir:$PATH"`
```
[train@localhost ~]$ runHello.sh
bash: runHello.sh: command not found...

[train@localhost ~]$ production_level_ds/linux_basic/play/runHello.sh
Hello world
Current directory: /home/train
```

But when I add the folder where runHello.sh in to PATH I won't to specify directory everytime I run script.  
```
[train@localhost ~]$ export PATH="/home/train/production_level_ds/linux_basic/play:$PATH"
[train@localhost ~]$ runHello.sh
Hello world
Current directory: /home/train
```