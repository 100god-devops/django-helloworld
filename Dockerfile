FROM ubuntu:20.04
RUN apt-get update && apt-get install -y tzdata && apt install -y python3.8 python3-pip curl
RUN apt install python3-dev libpq-dev nginx python3-pip python3-virtualenv sqlitebrowser wget ruby-full -y
#RUN wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
#CMD ["chmod", "+x", "./install"]
#CMD ["sudo", "./install", "auto"]
RUN pip install django gunicorn psycopg2
#RUN mkdir -p /root/.aws
#COPY .aws/credentials /root/.aws/credentials
#COPY .aws/config /root/.aws/config
#CMD ["touch", "/root/.aws/credentials"]
#CMD ["touch", "/root/.aws/config"]
#CMD ["echo", "[default]", ">>", "/root/.aws/credentials"]
#CMD ["echo aws_access_key_id = AKIA4VGPGKU6F66GV6SM >> /root/.aws/credentials"]
#CMD ["echo aws_secret_access_key = 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 >> /root/.aws/credentials"]
#CMD ["echo [default] >> /root/.aws/config"]
#CMD ["echo region = us-east-1 >> /root/.aws/config"]
#CMD ["echo output = json >> /root/.aws/config"]

#CMD ["./dependencies_install.sh"]
#RUN ["curl", "-o", "kubectl", "https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl"]
#RUN ["chmod", "+x", "./kubectl"]
#RUN ["mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin"]
#RUN ["echo", "'export PATH=$PATH:$HOME/bin'", ">>", "~/.bashrc"]
#RUN ["echo", "'Check kubectl version'"]
#RUN ["kubectl", "version", "--short", "--client"]
ADD . /opt/django-helloworld/
WORKDIR /opt/django-helloworld/
RUN pip install -r requirements.txt
EXPOSE 8000
CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "helloworld.wsgi"]
