FROM ubuntu
COPY simpleApp /simpleApp
COPY requirements.txt /simpleApp
COPY  manage.py /simpleApp
WORKDIR /simpleApp
RUN apt-get update
RUN apt-get -y install python3-pip
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6","manage. This branch is 5 commits ahead of mahmoud254:master. py","runserver 0.0.0.0:8000"]
