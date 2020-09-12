FROM ubuntu
Run mkdir simpleApp1
COPY simpleApp /simpleApp1/simpleApp
COPY requirements.txt /simpleApp1
COPY manage.py /simpleApp1
WORKDIR /simpleApp1
RUN apt-get update
RUN apt-get -y install python3-pip
RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
CMD ["python3","manage.py","runserver 8000"]
