# use the official PHP image as base image
FROM php:8.1-fpm
# INSTALL ZIP TO USE COMPOSER
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    wget \
    unzip
  
RUN docker-php-ext-install zip
RUN apt-get install -y autoconf pkg-config libssl-dev
RUN pecl install mongodb
RUN echo "extension=mongodb.so" >> /usr/local/etc/php/conf.d/mongodb.ini
# run Composer as root
ENV COMPOSER_ALLOW_SUPERUSER=1
# copy the Composer PHAR from the Composer image into the PHP image
COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer
# show that both Composer and PHP run as expected
RUN composer --version && php -v

# copy the composer.json file
#COPY composer.json .

# RUN composer install
#RUN composer install --prefer-dist --no-dev --no-scripts --no-progress --no-interaction


WORKDIR /usr/local/apache2/htdocs

RUN wget -P /usr/local/apache2/htdocs https://raw.githubusercontent.com/plats98/php/main/composer.json
#COPY composer.json composer.lock ./

RUN composer install

