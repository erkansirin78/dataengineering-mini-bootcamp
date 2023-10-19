## locate and find help us search and find files   
- `locate` uses a db located in `/var/lib/mlocate/mlocate.db` 
- `find` search directly in filesystem.

## locate   
```
[train@localhost play]$ locate Advertising.csv
/home/train/datasets/Advertising.csv
/home/train/production_level_ds/linux_basic/play/Advertising.csv.gz
```

## find 
### Format  
` find [where to start searching from] [-options] [what to find] ` 
```
[train@localhost play]$ find /home/train/ -name "Advertising.*"
/home/train/datasets/Advertising.csv
/home/train/production_level_ds/linux_basic/play/Advertising.csv.gz
```
- find a directory named apt in /home 
` sudo find /home -type d -name "apt" `   

- find pip or pip3 files 
` sudo find / -type f \( -name "pip" -o -name "pip3" \)  `  

- Find and delete all files newer than a given date
` find . -newermt "Aug 9 22:27" -exec rm -rf {} + ` 

- Find and delete directories newer than a given date
` find . -type d -newermt "Aug 9 22:27" -exec rm -rf {} + ` 

- Find and delete files newer than a given date
` find . -type f -newermt "Aug 9 22:27" -exec rm -rf {} + ` 


- more examples
` https://www.binarytides.com/linux-find-command-examples/ ` 

