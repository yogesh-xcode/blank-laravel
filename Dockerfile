FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
        libzip-dev \
        libpq-dev \
        libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) zip gd pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN addgroup --system laravel && adduser --system --ingroup laravel laravel

WORKDIR /var/www

COPY docker/startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

RUN chown -R laravel:laravel /var/www

USER laravel

EXPOSE 9000
CMD ["startup.sh"]
