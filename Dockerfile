FROM php:8.3-fpm AS php-base

FROM node:22-bookworm-slim AS node-bins

FROM php-base

ARG UID=1000

RUN apt-get update && apt-get install -y \
        libzip-dev \
        libpq-dev \
        libicu-dev \
        libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
        unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) zip gd pdo_pgsql intl \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY --from=node-bins /usr/local/bin/node /usr/local/bin/
COPY --from=node-bins /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN ln -sf ../lib/node_modules/corepack/dist/corepack.js /usr/local/bin/corepack && \
    ln -sf ../lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm && \
    ln -sf ../lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx

RUN addgroup --system laravel && adduser --uid $UID --ingroup laravel --no-create-home laravel

WORKDIR /var/www

COPY docker/startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

USER laravel

EXPOSE 9000
CMD ["startup.sh"]
