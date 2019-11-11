FROM python:3.7

WORKDIR /todo-app

COPY . /todo-app

RUN apt-get update && apt-get install -y \
	default-libmysqlclient-dev \
	python3-dev \
    pycodestyle \
	gcc

RUN pip install -r requirements.txt

ENV FLASK_APP project.py
ENV DATABASE_URL mysql://todo_app:password@172.31.38.88/TodoApp
ENV SQLALCHEMY_TRACK_MODIFICATIONS False
ENV JWT_SECRET_KEY 9102ieq-djvh10-wakd2109masx391urfha

CMD ["flask", "db", "init"]
CMD ["flask", "db", "upgrade"]
CMD ["python", "project.py"]
