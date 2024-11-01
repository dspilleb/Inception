#! /bin/bash
mysqld_safe &

until mysqladmin ping 2> /dev/null; do
	sleep 2
done

if [ ! -d "/var/lib/mysql/${MYSQL_NAME}" ]; then

	mysql -u root << END
		CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME};

		CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}';
		GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASS}';

		ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';
		FLUSH PRIVILEGES;
END
fi

mysqladmin -u root --password=${MYSQL_ROOT_PASS} shutdown

exec "$@"