FROM ubuntu
COPY simpleApp /simpleApp
WORKDIR /simpleApp
COPY requirements.txt /simpleApp
COPY  manage.py /simpleApp
WORKDIR /simpleApp
RUN  pip3 install -r requirements.txt
RUN  python3.6 manage.py makemigrations
RUN  python3.6 manage.py migrate
CMD ["python3.6","manage.py","runserver 0.0.0.0:8000"]
