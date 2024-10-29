FROM debian:11
EXPOSE 443

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get -y install nginx \
	&& apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl

# generate a self-signed SSL certificate using OpenSSL. 
RUN openssl req -x509 \
	-newkey rsa:2048 \
	-nodes \
	-out /etc/nginx/ssl/Dan.crt \
	-keyout /etc/nginx/ssl/Dan.key \
	-subj "/C=BE/ST=BC/L=Brussels/O=19/OU=19/CN=dspilleb.42.fr/UID=login"

# Create folder for Nginx configs
RUN mkdir -p /var/run/nginx

# Replace the nginx image conf with our local conf
#COPY  /conf/nginx.conf /var/run/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
