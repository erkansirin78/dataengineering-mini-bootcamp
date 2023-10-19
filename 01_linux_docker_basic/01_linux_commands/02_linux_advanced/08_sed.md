### sed 
- stream editor, a non-interactive command-line text editor.

- without -i we check the tesult is expeted (dry-run)

### sed replace 

- Format `sed -i 's/SEARCH_REGEX/REPLACEMENT/g' INPUTFILE`

`-i` - By default sed writes its output to the standard output. This option tells sed to edit files in place. If an extension is supplied (ex -i.bak) a backup of the original file will be created.  
`s` - The substitute command, probably the most used command in sed.  
`/ / /` - Delimiter character. It can be any character but usually the slash (/) character is used.  
`SEARCH_REGEX` - Normal string or a regular expression to search for.  
`REPLACEMENT` - The replacement string.  
`g` - Global replacement flag. By default, sed reads the file line by line and changes only the first occurrence of the SEARCH_REGEX on a line. When the replacement flag is provided, all occurrences will be replaced.  
`INPUTFILE` - The name of the file on which you want to run the command    

- sample file:
```
[ansadmin@kmaster1 ansible_tutorial]$ cat install_httpd.yaml
---
- name: update web servers
  hosts: webservers
  remote_user: root

  tasks:
  - name: ensure apache is at the latest version
    yum:
      name: httpd
      state: latest
  - name: write the apache config file
    template:
      src: /srv/httpd.j2
      dest: /etc/httpd.conf
```

### search and replace 

- Let's find webservers and replace with all .
`[ansadmin@kmaster1 ansible_tutorial]$ sed -i 's/webservers/all/g' install_httpd.yaml`

```
[ansadmin@kmaster1 ansible_tutorial]$ cat install_httpd.yaml
---
- name: update web servers
  hosts: all
  remote_user: root

  tasks:
  - name: ensure apache is at the latest version
    yum:
      name: httpd
      state: latest
  - name: write the apache config file
    template:
      src: /srv/httpd.j2
      dest: /etc/httpd.conf
```

## +
- To prevent confusion you can use + instead of / 

Following will replace `/usr/lib/jvm/java-1.8.0-openjdk/`   
with `JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk`  

```
[ansadmin@utility ~]$ sed -i 's+/usr/lib/jvm/java-1.8.0-openjdk/+export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk+g' /opt/hadoop/etc/hadoop/hadoop-env.sh
```

### Example: replace every occurrence of 'hello' with 'world' on lines 10-20
$ sed '10,20s/hello/world/' input.txt > output.txt
