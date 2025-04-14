FROM php:8.2-apache
WORKDIR /var/www/
RUN mkdir symfony
COPY . symfony
COPY vhosts.conf /etc/apache2/sites-enabled
RUN /etc/init.d/apache2 restart
EXPOSE 80