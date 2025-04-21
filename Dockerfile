FROM php:8.2-fpm

USER root
RUN apt-get update && apt-get install -y git unzip libicu-dev zip \
    && docker-php-ext-install pdo pdo_mysql intl

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
RUN composer self-update --2        # ← force Composer ≥ 2.2

WORKDIR /var/www
COPY . .
RUN composer install --no-interaction --prefer-dist

EXPOSE 8000
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
