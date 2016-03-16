FROM ubuntu:latest
MAINTAINER Webmaster <webmaster@netfinity.cz>

RUN apt-get update && \
  apt-get -y install git wget curl joe mysql-client php5-cli php5-mysql \
	php5-gd php5-imagick php5-tidy

# users acme 1000, www-manage 1001, www-user 1002
RUN adduser --disabled-password --gecos "" acme && \   
    adduser --disabled-password --gecos "" www-manage && \
    adduser --disabled-password --gecos "" www-user && \
    usermod -a -G www-user www-manage
