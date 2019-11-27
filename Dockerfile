FROM python:3.7

WORKDIR /todo-app

COPY . /todo-app

RUN apt-get update && apt-get install -y \
	default-libmysqlclient-dev \
	python3-dev \
    pycodestyle \
	gcc

RUN pip install -r requirements.txt

ENV DATABASE_URL mysql://root:password@db/TodoAppTest
ENV SQLALCHEMY_TRACK_MODIFICATIONS False
ENV JWT_SECRET_KEY secret

CMD ["python", "project.py"]
