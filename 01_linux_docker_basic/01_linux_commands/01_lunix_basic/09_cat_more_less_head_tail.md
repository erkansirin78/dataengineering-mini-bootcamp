## 1. cat
`[train@localhost play]$ cat ~/datasets/Advertising.csv`  

- see the line numbers: -n

## 2. more 
`[train@localhost play]$ more ~/datasets/Advertising.csv`  

## 3. less
`[train@localhost play]$ less ~/datasets/Advertising.csv`  

- less and more similar but less is more advanced.

- exit: q
- search: /keyword
- bottom: G
- top: g 

## 4. head  
`[train@localhost play]$ head ~/datasets/Advertising.csv`  

specify row number  
```
[train@localhost play]$ head -n 25 ~/datasets/Advertising.csv
[train@localhost play]$ head -25 ~/datasets/Advertising.csv
```

## 5. tail
```
[train@localhost play]$ tail -n 15 ~/datasets/Advertising.csv
[train@localhost play]$ tail -15 ~/datasets/Advertising.csv
```

- tail a log file realtime
` tail -f logfile ` 

## 6. multitail
To tail multiple files in a directory. For example tail every 5 secs.
`multitail -Q 5 '/tmp/data-generator/output/*'`