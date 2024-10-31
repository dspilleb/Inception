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

RUN wget https://fr.wordpress.org/wordpress-6.6.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.6.2-fr_FR.tar.gz && rm wordpress-6.6.2-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/init_wordpress.sh .
RUN chmod +x init_wordpress.sh


ENTRYPOINT ["./init_wordpress.sh"]
CMD ["php-fpm7.4", "-F"]
