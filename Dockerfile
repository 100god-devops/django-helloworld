FROM ubuntu:20.04
RUN apt-get update && apt-get install -y tzdata && apt install -y python3.8 python3-pip
RUN apt install python3-dev libpq-dev nginx python3-pip python3-virtualenv sqlitebrowser -y
#RUN pip install django gunicorn psycopg2
ADD . /opt/django-helloworld/
WORKDIR /opt/django-helloworld/
RUN pip install -r requirements.txt
EXPOSE 8000
CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "helloworld.wsgi"]
