# xargs 
### Build and execute command lines from standard input

## Format
` command1 | xargs command2 `

## How to give input echo as an ouput of other command?
```
[train@localhost play]$ seq 5
1
2
3
4
5
[train@localhost play]$ seq 5 | echo

```
## xargs
```
[train@localhost play]$ seq 5 | xargs echo
1 2 3 4 5

[train@localhost play]$ seq 5 | xargs -n 1 echo
1
2
3
4
5
```

# Real example

## create 3 kind of files
```
[train@localhost play]$ touch file{1..9}.jpg
[train@localhost play]$ touch file{1..9}.pdf
[train@localhost play]$ touch file{1..9}.txt
[train@localhost play]$ ll
total 0
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file1.jpg
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file1.pdf
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file1.txt
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file2.jpg
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file2.pdf
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file2.txt
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file3.jpg
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file3.pdf
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file3.txt
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file4.jpg
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file4.pdf
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file4.txt
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file5.jpg
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file5.pdf
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file5.txt
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file6.jpg
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file6.pdf
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file6.txt
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file7.jpg
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file7.pdf
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file7.txt
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file8.jpg
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file8.pdf
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file8.txt
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file9.jpg
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file9.pdf
-rw-rw-r--. 1 train train 0 Sep  5 19:24 file9.txt
```

## Find jpg files only
```
[train@localhost play]$ find . -maxdepth 1 -name "*.jpg"
./file1.jpg
./file2.jpg
./file3.jpg
./file4.jpg
./file5.jpg
./file6.jpg
./file7.jpg
./file8.jpg
./file9.jpg
```

## Archive jpg file using xargs 
```
[train@localhost play]$ find . -maxdepth 1 -name "*.jpg" | xargs tar -czf jpeg.tgz
[train@localhost play]$ ll | grep 'tgz'
-rw-rw-r--. 1 train train 186 Sep  5 19:27 jpeg.tgz
```
## List what is in the archive file (To check if we do the right thing)
```
[train@localhost play]$ tar -tvf jpeg.tgz
-rw-rw-r-- train/train       0 2021-09-05 19:24 ./file1.jpg
-rw-rw-r-- train/train       0 2021-09-05 19:24 ./file2.jpg
-rw-rw-r-- train/train       0 2021-09-05 19:24 ./file3.jpg
-rw-rw-r-- train/train       0 2021-09-05 19:24 ./file4.jpg
-rw-rw-r-- train/train       0 2021-09-05 19:24 ./file5.jpg
-rw-rw-r-- train/train       0 2021-09-05 19:24 ./file6.jpg
-rw-rw-r-- train/train       0 2021-09-05 19:24 ./file7.jpg
-rw-rw-r-- train/train       0 2021-09-05 19:24 ./file8.jpg
-rw-rw-r-- train/train       0 2021-09-05 19:24 ./file9.jpg
```

## We don't need jpg files anymore. Let's delete them
```
[train@localhost play]$ find . -maxdepth 1 -name "*.jpg" -delete
[train@localhost play]$ ll
total 4
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file1.pdf
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file1.txt
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file2.pdf
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file2.txt
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file3.pdf
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file3.txt
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file4.pdf
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file4.txt
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file5.pdf
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file5.txt
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file6.pdf
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file6.txt
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file7.pdf
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file7.txt
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file8.pdf
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file8.txt
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file9.pdf
-rw-rw-r--. 1 train train   0 Sep  5 19:24 file9.txt
-rw-rw-r--. 1 train train 186 Sep  5 19:27 jpeg.tgz
```

## -I option
We can list full path of file with -I option and placeholders ({})
First {} is decleration of what we will use as placeholder. Second usage of {} is the use it where we want. 
We have to use what we have declared. 
```
[train@localhost play]$ ls | xargs -I {} echo "$(pwd)/{}"
/home/train/atscale4/linux_basics/play/file1.pdf
/home/train/atscale4/linux_basics/play/file1.txt
/home/train/atscale4/linux_basics/play/file2.pdf
/home/train/atscale4/linux_basics/play/file2.txt
/home/train/atscale4/linux_basics/play/file3.pdf
/home/train/atscale4/linux_basics/play/file3.txt
/home/train/atscale4/linux_basics/play/file4.pdf
/home/train/atscale4/linux_basics/play/file4.txt
/home/train/atscale4/linux_basics/play/file5.pdf
/home/train/atscale4/linux_basics/play/file5.txt
/home/train/atscale4/linux_basics/play/file6.pdf
/home/train/atscale4/linux_basics/play/file6.txt
/home/train/atscale4/linux_basics/play/file7.pdf
/home/train/atscale4/linux_basics/play/file7.txt
/home/train/atscale4/linux_basics/play/file8.pdf
/home/train/atscale4/linux_basics/play/file8.txt
/home/train/atscale4/linux_basics/play/file9.pdf
/home/train/atscale4/linux_basics/play/file9.txt
/home/train/atscale4/linux_basics/play/jpeg.tgz
```