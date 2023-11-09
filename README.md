# VBO Data Engineer Mini Bootcamp

This GitHub repository contains resources of Veri Bilimi Okulu Data Engineering Mini Bootcamp course.

## Week 1: Fundamentals and Preparation
- Introduction to Data Engineering.
- centos_min virtual machine image link: https://drive.google.com/drive/folders/1XO8UYcnZlahpmT7RgQ_vhR67dB7lr3Fu?usp=share_link
- Basics of Linux 

## Week 2: Big Data Processing and Spark
- Docker
- Apache Spark Local Setup and Basic Dataframe Operations-1 

## Week 3: Data Stream Management and Kafka
- Apache Spark Docker Setup and Dataframe Operations-2
- Basics of data stream management using Apache Kafka.

## Week 4: Data Analysis with Python and SQL
- Basic SQL queries on PostgreSQL.
- Data analysis using Python.


---

## Setting Up the Docker Environment

We will use docker for hands-on exercises. We assume you already have Docker on your machine. To set up the Docker environment follow these steps:

1. First, download or clone the project files from the GitHub repository. This will give you access to the main directory of the project containing the training materials.
- Open terminal/powershell
```commandline
git clone https://github.com/erkansirin78/dataengineering-mini-bootcamp
cd dataengineering-mini-bootcamp/00_playground
find . -type f -exec sed -i 's/\r$//' {} \;
docker-compose up --build -d 
```

These commands use Docker Compose to start the Docker containers used in the training and rebuild them if necessary. The "-d" flag runs the containers in the background, while the "--build" flag rebuilds the containers using the Dockerfiles.

Once you've completed these steps, the Docker environment for the training will be set up, and participants can use Docker containers to run the training materials.
