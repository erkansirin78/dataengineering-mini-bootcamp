- A **process** is the instance of a computer program that is being executed by one or many threads.

- Modern operating systems are usually multitasking, meaning they create the illusion  
of doing more than one thing at once by rapidly switching from one executing program  
to another. The kernel manages this through the use of processes. Processes are how Linux organizes the  
different programs waiting for their turn at the CPU.  


## How to see processes?  
- ps - report a snapshot of the current processes.  
- top -
- htop - Advenced version of top  

## PID: Process ID makes distinguishable processes.  
- How to learn PID of a procees?  
`pidof`

## Types of Processes:
- Foreground (interactive)
- Background (non-interactive)

## Stopping proces
- with pid
`kill <pid_of_process>`  
- with name
`pkill firefox` or `kilall firefox`  

## top and htop
- `top` or `htop` let us to monitor processes  

- In Linux a **service** is just another name for a **daemon**, which is a client / server application that runs in the background. A service continuously listens for incoming requests and sends a response based on the request given. A process is simply an application or a script which can be running in the foreground or the background.


## list all services and grep from it
```
[train@localhost play]$ sudo systemctl --type=service | grep postgresql
postgresql-10.service loaded active running   PostgreSQL 10 database server
```

## Inspect journal logs belong to a service 
` sudo journalctl -u airflow.service ` 

## Watch and debug journal errors
` sudo journalctl -u airflow -f ` 

## systemctl 
Start service  
`sudo systemctl start service_name`

Stop service  
`sudo systemctl stop service_name`

Restart service  
`sudo systemctl restart service_name`

See the status  
`sudo systemctl status service_name`

If you want a service run when machine starts  
`sudo systemctl enable service_name`

If you don't want a service run when machine starts  
`sudo systemctl disable service_name`



## ps aux 
Popular set of ps options giving more detail.
```
[train@localhost linux_basic]$ ps aux
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
```
## ps -ef | grep servicename

## Putting a process to background 
`process & `  

## kill 
`kill PID`

Actually kill doesn't kill the process just sends the signal.  

## List all running systemctl services
` systemctl --type=service | grep running `