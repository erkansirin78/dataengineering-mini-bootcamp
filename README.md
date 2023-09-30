# VBO Data Engineer Mini Bootcamp

This GitHub repository serves as a resource center for a mini bootcamp focused on Data Engineering topics. Here's a summary of the curriculum:

### Week 1: Fundamentals and Preparation

- Introduction to Data Engineering.
- Basics of Linux and Docker.

### Week 2: Big Data Processing and Spark

- Fundamentals of big data processing with Apache Spark and data transformation operations.

### Week 3: Data Stream Management and Kafka

- Basics of data stream management using Apache Kafka.

### Week 4: Data Analysis and Databases

- Data analysis using Python.
- Fundamentals of PostgreSQL databases.

This repository includes lecture notes, sample code, and additional resources for each week. Participants can utilize these resources to enhance their Data Engineering skills.

---

## Setting Up the Docker Environment for Training

To set up the Docker environment for use during the training, follow these steps:

1. First, download or clone the project files from the GitHub repository. This will give you access to the main directory of the project containing the training materials.

2. Open a terminal or command prompt.

3. Use the following command to navigate to the directory corresponding to the relevant training week. For example, to navigate to the "00_playground" directory:

```bash
cd 00_playground
```

4. Use the following commands to initiate the Docker infrastructure and create containers:

```bash
docker-compose up -d --build
```

These commands use Docker Compose to start the Docker containers used in the training and rebuild them if necessary. The "-d" flag runs the containers in the background, while the "--build" flag rebuilds the containers using the Dockerfiles.

Once you've completed these steps, the Docker environment for the training will be set up, and participants can use Docker containers to run the training materials.
