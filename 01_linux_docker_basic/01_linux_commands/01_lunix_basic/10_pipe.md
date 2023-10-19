pipe makes output of a command as input to another one.  

Example:  
tail last 15 rows and filter that contains 198 
```
[train@localhost play]$ tail -n 15 ~/datasets/Advertising.csv | grep 198
198,177,9.3,6.4,12.8
```


