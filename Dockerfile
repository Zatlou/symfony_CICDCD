FROM debian
RUN apt update
RUN apt install -y apache2 php php-mysql php-xml php-mbstring php-curl php-zip
WORKDIR /var/www/
RUN mkdir symfony
COPY . symfony
COPY vhosts.conf /etc/apache2/sites-enabled
RUN /etc/init.d/apache2 restart
EXPOSE 80
CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]