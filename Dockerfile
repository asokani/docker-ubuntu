FROM ubuntu:latest
MAINTAINER Webmaster <webmaster@netfinity.cz>

RUN apt-get update && \
  apt-get -y install git wget curl joe mysql-client

# users www-data 33, acme 1000, www-manage 1001
RUN sudo adduser --disabled-password --gecos "" acme && \ 
    sudo adduser --disabled-password --gecos "" www-manage

