#!/bin/bash
# check if wordpress is already set-up
if [ ! -f /var/www/wordpress/wp-config.php ]; then

	# wait for mariadb to be launched
	while ! mysqladmin ping --host=mariadb --user=${MYSQL_ROOT_USER} --password=${MYSQL_ROOT_PASS}; do
		sleep 2
	done

	cd /var/www/wordpress

	# Link wordpress to the database
	wp config create	--allow-root \
						--dbname=${MYSQL_NAME} \
						--dbuser=${MYSQL_ROOT_USER} \
						--dbpass=${MYSQL_ROOT_PASS} \
						--dbhost=mariadb:3306 --path='/var/www/wordpress'
	# Config wordpress and create admin account
	wp core install --allow-root \
					--url=${DOMAIN_NAME} \
					--title=${SITE_TITLE} \
					--admin_user=${WORDPRESS_ADMIN} \
					--admin_password=${WORDPRESS_ADMIN_PASS} \
					--admin_email=${WORDPRESS_ADMIN_MAIL} \
					--skip-email \
	# create an user
	wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_MAIL} \
					--user_pass=${WORDPRESS_USER_PASS} \
					--role='author' \
					--allow-root
fi


# launch php to listen requests
exec "$@"