The sort program sorts the contents of standard input, or one or more files
specified on the command line, and sends the results to standard output.

- Usage: sort [OPTION]... [FILE]...

## Create a file  
```
[train@localhost linux]$ cat > names.txt  << EOF 
ali
mahmut
cemal
gizem
burcu
EOF
```


## sort
```
[train@localhost linux]$ sort names.txt
ali
burcu
cemal
gizem
mahmut
```

## Reverse sort 
```
[train@localhost linux]$ sort -r names.txt
mahmut
gizem
cemal
burcu
ali
```

## Add new field to sortfile
```
[train@localhost linux]$ cat <<EOF > age_name.txt
ali;33
mahmut;25
cemal;41
gizem;27
burcu;33
EOF
```

## Sort by age   
```
[train@localhost linux]$ sort -t\; -k2 age_name.txt
mahmut;25
gizem;27
ali;33
burcu;33
cemal;41
```

## Reverse order age
```
[train@localhost linux]$ sort -t\; -k2 -r age_name.txt
cemal;41
burcu;33
ali;33
gizem;27
mahmut;25
```

- `-t` is for seperator   
- `-k` is for column index (starts from 1)  
- Content will be considered as string  
