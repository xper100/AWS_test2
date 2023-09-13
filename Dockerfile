FROM php:8.1-apache

ENV TZ=Asia/Seoul

RUN apt-get update && \
    apt-get install -y libpq-dev && \
    docker-php-ext-install pdo pdo_pgsql pgsql && \
    apt-get -y install openssh-server

RUN apt -y install npm && \
    apt -y install yarn

RUN sed -i 's/\/var\/www\/html/\/home\/jyp\/www/g' /etc/apache2/sites-available/000-default.conf
RUN sed -i 's/\/var\/www/\/home\/jyp\/www/g' /etc/apache2/apache2.conf

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini && \
    echo "error_log = /home/senior-nutrition/log/php_error.log" >> /usr/local/etc/php/php.ini && \
    echo "date.timezone = 'Asia/Seoul'" >> /usr/local/etc/php/php.ini

RUN service apache2 restart && \
    service ssh restart

WORKDIR /home/jyp/www
