FROM debian:11

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install mariadb-server -y

RUN mkdir -p /run/mysqld /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld /var/lib/mysql && chmod 755 /run/mysqld /var/lib/mysql

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf	
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf && chown -R mysql:mysql /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_mysql.sh .
RUN chmod +x init_mysql.sh

ENTRYPOINT ["./init_mysql.sh"]
CMD ["mysqld_safe"]