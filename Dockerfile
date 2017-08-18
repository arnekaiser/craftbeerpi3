FROM debian:stable
MAINTAINER Arne Kaiser <onkelarne@gmail.com>

# install packages and clean
RUN apt-get update -y && \ 
apt-get upgrade -y && \
apt-get install -y python-setuptools python-pip python-dev libpcre3-dev && \
apt-get clean

# add sources 
RUN mkdir -p /app
WORKDIR /app
ADD . /app

# install required packages
RUN pip install -r requirements.txt

# start server
CMD ["python", "run.py"]