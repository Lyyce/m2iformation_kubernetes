# ubuntu image we are starting from (only need to have apt installed and access to repo)
FROM ubuntu:focal-20220922
# define region in the environement (mysql-server needs it)
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /src

# install python and pip, then flask, mysql and mysql-config
RUN apt-get update && apt-get install -y --no-install-recommends \
     python3 \
     python3-dev \
     python3-pip  \
     python3-flask \
     mysql-server  \
     default-libmysqlclient-dev

# allows flask to use mysql
RUN pip install flask-mysql

ADD src .
ADD tmp /tmp
COPY src/students.sql /tmp/

CMD ["service","mysql","start"]
CMD ["python3", "-u", "app.py"]


# docker build . -t ubuntu_flask:1.0.2
# docker tag ubuntu_flask:1.0.0 anthonyrouquier/ubuntu_flask:1.0.2
# docker push anthonyrouquier/ubuntu_flask:1.0.2
