FROM debian:11

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y wget \
	php7.4 \
	mariadb-client \
	php7.4-fpm \
	php7.4-curl \
	php7.4-mysql

RUN mkdir -p /run/php/
RUN	mkdir -p /var/www/html

EXPOSE 9000

RUN wget https://fr.wordpress.org/wordpress-6.6.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.6.2-fr_FR.tar.gz && rm wordpress-6.6.2-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]
