FROM ubuntu:latest
MAINTAINER Webmaster <webmaster@netfinity.cz>

RUN apt-get update && \
  apt-get -y install git wget curl joe mysql-client

# users www-data 33, acme 1000, www-manage 1001
RUN adduser --disabled-password --gecos "" acme && \ 
    adduser --disabled-password --gecos "" www-manage && \
    usermod -a -G www-data www-manage

