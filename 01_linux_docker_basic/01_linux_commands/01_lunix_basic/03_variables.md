1. env   
to see what is in the ENV 

2. Local and Global Variables  
local 
```
[train@localhost play]$ MY_HOME=/home/train
[train@localhost play]$ env | grep MY_HOME
```
there will be nothing because evn holds global variables 
MY_HOME will be local unless we push it with **export**  

global 
```
[train@localhost play]$ export MY_HOME
[train@localhost play]$ env | grep MY_HOME
MY_HOME=/home/train
```

3. print a variable 
```
[train@localhost play]$ MY_LOCAL="This is my local var."
[train@localhost play]$ echo $MY_LOCAL
This is my local var.
```

```
[train@localhost play]$ export MY_GLOBAL="This is my global var"
[train@localhost play]$ echo $MY_GLOBAL
This is my global var
```
4. unset (delete a variable)
```
[train@localhost play]$ unset MY_GLOBAL
[train@localhost play]$ echo $MY_GLOBAL
```
