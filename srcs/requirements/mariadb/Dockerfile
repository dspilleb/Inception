FROM debian:11

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf	
RUN mkdir -p /run/mysqld 

COPY tools/init.sql /etc/mysql/init.sql

CMD ["mysqld_safe"]