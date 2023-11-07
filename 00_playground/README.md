## Copy files to VM

## Fix file
```commandline
find . -type f -exec sed -i 's/\r$//' {} \;
```

## Run docker-compose
```commandline
docker-compose up --build -d
```