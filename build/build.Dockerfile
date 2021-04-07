FROM php:8.0.3-fpm-alpine

RUN set -ex \
    && apk --no-cache add \
        postgresql-dev

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo pdo_pgsql

RUN addgroup -g 1000 prod && \
    adduser -G prod -g prod -s /bin/sh -D prod

RUN mkdir -p /var/www/html

RUN chown prod:prod /var/www/html

WORKDIR /var/www/html

COPY ./src /var/www/html

RUN composer install

EXPOSE 80 443

CMD php artisan serve --host=0.0.0.0 --port=80
