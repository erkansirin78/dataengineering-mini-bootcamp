### Regular expressions are symbolic notations used to identify patterns in text.

- **grep “global regular expression print”** so we can see that grep has something to do with regular expressions.  

- `^`	Start of expression    
- `$`	End of expression  
- `.` or Dot will match any character  
- `[ ]`       will match a range of characters  
- `[^ ]`      will match all character except for the one mentioned in braces  
- `*`          will match zero or more of the preceding items  
- `+`         will match one or more of the preceding items  
- `?`         will match zero or one of the preceding items  
- `{n}`      will match ‘n’ numbers of preceding items  
- `{n,}`     will match ‘n’ number of or more of preceding items  
- `{n m}`  will match between ‘n’ & ‘m’ number of items  
- `{ ,m}`   will match less than or equal to m number of items  


### data: 
- `https://raw.githubusercontent.com/erkansirin78/datasets/master/words.txt ` 

- Usage: ` grep [OPTION]... PATTERN [FILE]...` 

###  `caret (^)` 
- Starts with Erk  
```
[train@localhost play]$ grep ^Erk ~/datasets/words.txt
Erk
Erkan
Erkanıharp
Erke
Erkek
Erkeklenmek
Erkekleşmek
Erkekli
..
..
```
- With line numbers
```
[train@localhost ~]$ grep -n ^Erk ~/datasets/words.txt
9870:Erk
9871:Erkan
9872:Erkanıharp
9873:Erke
9874:Erkek
9875:Erkeklenmek
9876:Erkekleşmek
9877:Erkekli
...
...
```

### `$` 
- Ends with kuş 
``` 
[train@localhost play]$ grep kuş$ ~/datasets/words.txt
Akkuş
Baykuş
Boğmaklıkuş
Islıkçıkuş
Karakuş
Kokuş
Sokuş
Yokuş
Şarkıcıkuş  
```

### `.` 
- Includes k.ş there can be anything in place of .
```
[train@localhost play]$ grep "k.ş" ~/datasets/words.txt
Afyonkeş
Afyonkeşlik
Akkuş
Akış
Akışkan
```

- Includes bak  
`[train@localhost play]$ grep bak ~/datasets/words.txt`  

### -v
- Ends with kuş but not starts with ak. v: for non-matching, i for case insensitive
```
[train@localhost play]$ grep kuş$ ~/datasets/words.txt | grep -vi ^ak
Baykuş
Boğmaklıkuş
Islıkçıkuş
Karakuş
Kokuş
Sokuş
Yokuş
Şarkıcıkuş
```
- Same but case sensitive  
```
[train@localhost play]$ grep kuş$ ~/datasets/words.txt | grep -v ^ak
Akkuş
Baykuş
Boğmaklıkuş
Islıkçıkuş
Karakuş
Kokuş
Sokuş
Yokuş
Şarkıcıkuş
```
### -c, --count
- How many case that mach this filter?   -c, --count print only a count of matching lines per FILE
```
[train@localhost play]$ grep kuş$ ~/datasets/words.txt | grep -vc ^ak
9
```

- T...f starts T and after four character later includes f, there can be any three character in place of ...
```
[train@localhost play]$ grep "T...f" ~/datasets/words.txt
Taaffün
Tahaffuz
Tahaffuzhane
Taraf
Tarafeyn
Tarafgir
```

- Same but we restricted with finish character.
```
[train@localhost play]$ grep "T...f$" ~/datasets/words.txt
Taraf
Tarif
Tavaf
Telef
Telif
Tuhaf
```

### []
- [] Square braces are used to define a range of characters.  
```
[train@localhost play]$ grep M[au]*k ~/datasets/words.txt
Makabil
Makadam
Makak
..
..
Makûs
Muakkip
Mukabele
Mukabeleci
Mukabil
..
..
```
### [^ ]
- `[^ ]` This is like the not operator for regex. While using [^ ], it means that our search will include all the characters except the ones mentioned inside the square braces.
Exclude digits
```
[train@localhost play]$ grep [^0-9][A-Za-z] ~/datasets/mixed_tc_kimlik_names_numbers.txt
öbdolhölim öctüzc
öbdollöh ozdoğön
öbdollöh cözödöyi
öbdozöhim öcgül
öbdozzöhmön ogoz
öbdülcödiz öli İpoc
ödom cöyö
ödilo bİçoz
ödnön öğöz
ödnön çolİc
ödnön mondozos cozmön
öhmot böğözön
öhmot cödzi dİcböğ
...
..
```
### *
`*` will match zero or more of the preceding items 
```
[train@localhost play]$ grep Böğ* ~/datasets/words.txt
Bö
Böbrek
Böbreksi
Böbreküstübezi
Böbreğimsi
..
..
Böylemesine
Böylesi
Böylesine
Böğür
Böğürmek
Böğürtlen
Böğürtlenlik
```

### \
- `\` or Escape characters
\ is used when we need to include a character that is a metacharacter or has special meaning to regex. For example, we need to locate all the words ending with a dot, so we can use

### +
- `+` will match one or more of the preceding items  
- Starts with Böğ, rest can be anything  
```
[train@localhost play]$ grep "Böğ\+" ~/datasets/words.txt
Böğür
Böğürmek
Böğürtlen
Böğürtlenlik
Böğürtmek
Böğürtü
Böğürüş
```

### {n}
- `{n}`      will match ‘n’ numbers of preceding items  
- Filter 20 characters excluding digits  
```
[train@localhost play]$ grep "[A-Za-z]\{20\}" ~/datasets/words.txt
Avustralyakaratavuğu
Ayaksızkertenkelegiller
Ayaksızkertenkeleler
Biyolojileştiricilik
Elektroansefalografi
Karikatürleştirilmek
Kişiliksizleştirilme
Kişiliksizleştirilmek
Kuyruksallayangiller
Kırlangıçbalığıgiller
Muhabbetçiçeğigiller
Onikiparmakbağırsağı
Çıngıraklıyılangiller
```
- Just select tckn  
```
[train@localhost play]$ grep "[0-9]\{11\}" ~/datasets/mixed_tc_kimlik_names_numbers.txt
35063031338
55060093288
18393291330
86888386210
22938860638
26180015321
```

### Delete file that match the pattern  
` [train@localhost tmp]$ ls  | grep orange_file | xargs rm `

### Differences between grep, pgrep, egrep, and fgrep (Linux):
https://superuser.com/questions/508881/what-is-the-difference-between-grep-pgrep-egrep-fgrep

## Extention, -E
```
[ansadmin@utility helm_udemy]$ cat mychart/values.yaml
costCode: CC98112
projectCode: aazzxxyy
infra:
  zone: a,b,c
  region: us-e
tags:
  machine: frontdrive
  rack: 4c
  drive: ssd
  vcard: 8g
LangUsed:
  - Python
  - Ruby
  - Java
  - Scala
[ansadmin@utility helm_udemy]$ cat mychart/values.yaml | grep -E 'Python|machine:|region:'
  region: us-e
  machine: frontdrive
  - Python
```

### Grep OR
`grep -E 'pattern1|pattern2' filename`  or  `grep 'pattern1\|pattern2' filename` 

### Grep AND
`grep -E 'pattern1.*pattern2' filename`

### After/Before, -A -B: 
- Shows consequent n lines after or before matching pattern.   
Show 3 lines after Gülsüm including line.
```
 cat /d/Datasets/insanlar.csv | grep -A3 Gülsüm
1,"Gülsüm",35
2,"Cemal",23
3,"Elif",29
4,"Funda",41
```
Show 3 lines before Gülay line
```
cat /d/Datasets/insanlar.csv | grep -B3 Gülay
5,"Hamza",33
6,"Yalçın",45
7,"Mehmet",44
8,"Gülay",33
```
You can use both `  grep -A3 -B3  `  



