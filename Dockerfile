FROM ubuntu:latest
MAINTAINER Webmaster <webmaster@netfinity.cz>

RUN apt-get update && \
  apt-get -y install git wget curl joe

