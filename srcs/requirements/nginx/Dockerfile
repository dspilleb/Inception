FROM debian:11
RUN apt-get -y update && apt-get -y install nginx && apt install vim -y 
EXPOSE 443/tcp
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
