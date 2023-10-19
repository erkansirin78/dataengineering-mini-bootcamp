## watch
` watch -n INTERVAL_IN_SECONDS COMMAND `

` watch -n 1 kubectl get all `
- The -d (--difference), option will cause watch to highlight the changes between successive updates.

` watch -d -n 1 kubectl get all ` 

- To exit `Ctrl + C ` 

## shasum
- Usually used for file comparison or a file exists.
```
airflow@df7cd73e66b3:~$ shasum airflow.cfg
a94142bc3b645da69f91cdeeb4efbadf56dbdab8  airflow.cfg

airflow@df7cd73e66b3:~$ shasum airflow_backup.cfg
a94142bc3b645da69f91cdeeb4efbadf56dbdab8  airflow_backup.cfg
```

- If results of two file are identical that means two files are the same.

- Now add a line to second file then compare results
```
airflow@df7cd73e66b3:~$ echo "hello" >>  airflow_backup.cfg

airflow@df7cd73e66b3:~$ shasum airflow.cfg
a94142bc3b645da69f91cdeeb4efbadf56dbdab8  airflow.cfg

airflow@df7cd73e66b3:~$ shasum airflow_backup.cfg
3c51654ab798d30e1b9126803f84d49dee2ac1d5  airflow_backup.cfg
```
