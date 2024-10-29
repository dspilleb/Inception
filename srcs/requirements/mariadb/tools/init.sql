CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME};  -- Create the database

CREATE USER IF NOT EXISTS ${MYSQL_ROOT_USER}@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';  -- Create the 'admin' user
GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO ${MYSQL_ROOT_USER}@'%' IDENTIFIED BY '${MYSQL_ROOT_PASS}';  -- give all rights to the admin

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';  -- Make root share the same admin password

FLUSH PRIVILEGES;  -- refresh rights