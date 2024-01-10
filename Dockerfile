FROM ubuntu:22.04
MAINTAINER kn1ght <kn1ght@hacker.one>

RUN apt update
RUN apt install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

# Remove the default index.html
RUN rm /var/www/html/*

# Copy your custom HTML file to the nginx document root
COPY custom-index.html /var/www/html/index.html

VOLUME ["/data", "/etc/nginx/site-enabled", "/var/log/nginx"]

WORKDIR /etc/nginx

CMD ["nginx"]

EXPOSE 80
EXPOSE 443

