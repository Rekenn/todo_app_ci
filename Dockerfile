FROM python:3.7

WORKDIR /todo-app

COPY . /todo-app

RUN apt-get update && apt-get install -y \
	default-libmysqlclient-dev \
	python3-dev \
    pycodestyle \
	gcc

RUN pip install -r requirements.txt

CMD ["flask", "db", "init"]
CMD ["flask", "db", "upgrade"]
CMD ["python", "project.py"]
