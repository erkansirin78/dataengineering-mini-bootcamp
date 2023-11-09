```commandline
git clone https://github.com/erkansirin78/dataengineering-mini-bootcamp
cd dataengineering-mini-bootcamp/00_playground
find . -type f -exec sed -i 's/\r$//' {} \;
docker-compose up --build -d 
```