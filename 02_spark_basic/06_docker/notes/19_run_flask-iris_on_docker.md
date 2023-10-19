- github: https://github.com/erkansirin78/flask-iris-classification

- Download project
` git clone https://github.com/erkansirin78/flask-iris-classification.git ` 

` cd flask-iris-classification `

- Build image 
` docker image build -t my_flask_iris:1.0 . ` 

- Run container 
` docker run --rm --name flask_iris -p 8082:8080 -d my_flask_iris:1.0 ` 

- Open browser http://localhost:8082/

Enjoy your predictions.