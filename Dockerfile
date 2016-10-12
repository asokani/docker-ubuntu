FROM phusion/baseimage:0.9.18
MAINTAINER Asokani "https://github.com/asokani"

RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
  apt-get -y install zip git wget curl joe mysql-client php5-cli php5-mysql \
	php5-gd php5-imagick php5-tidy busybox openssl mc libmcrypt-dev \
	libmysqlclient-dev graphicsmagick-libmagick-dev-compat libcurl4-openssl-dev libonig-dev \
	build-essential python-software-properties \
	libssl-dev
	

# users acme 1000, www-manage 1001, www-user 1002
RUN adduser --disabled-password --gecos "" acme && \   
    adduser --disabled-password --gecos "" www-manage && \
    adduser --disabled-password --gecos "" www-user && \
    usermod -a -G www-user www-manage

# startup scripts
RUN mkdir -p /etc/my_init.d
# regen or copy ssh keys script
RUN rm -f /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN rm -f /etc/ssh_host_*
ADD gen_copy_ssh_host_keys.sh /etc/my_init.d/00-gen_copy_ssh_host_keys.sh

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*