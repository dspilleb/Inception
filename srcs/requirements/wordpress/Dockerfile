FROM debian:11

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y wget

RUN apt-get install -y php7.3\
	php-fpm\
	php-mysql\
	mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.6.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.6.2-fr_FR.tar.gz && rm wordpress-6.6.2-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress
COPY ./conf/www.conf ./etc/php/7.4/fpm/pool.d/www.conf