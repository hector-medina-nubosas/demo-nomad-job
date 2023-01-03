FROM php:7.2-apache

ADD app /var/www/html

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"] 