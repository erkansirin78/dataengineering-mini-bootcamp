FROM python:3.6

WORKDIR /app

COPY requirements.txt /app

RUN pip install -r requirements.txt

COPY hello.py /app

EXPOSE 5555

CMD ["python","hello.py"]
