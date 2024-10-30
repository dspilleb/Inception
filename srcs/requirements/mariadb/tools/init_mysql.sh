#!/bin/bash
mysqld_safe &

until mysqladmin ping; do
	sleep 2
done

mysql -u root << END
	CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME};

	CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASS}';
	GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO ${MYSQL_ROOT_USER}@'%' IDENTIFIED BY '${MYSQL_ROOT_PASS}';

	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';

	FLUSH PRIVILEGES;
END

mysqladmin -u root --password=${MYSQL_ROOT_PASS} shutdown

exec "$@"