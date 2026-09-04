#!/bin/sh
set -e

if [ ! -f ".env" ]; then
    echo "Creating .env from .env.example..."
    cp .env.example .env
fi

if [ ! -d "vendor" ]; then
    echo "Installing dependencies..."
    composer install --no-interaction --prefer-dist
fi

if grep -q "^APP_KEY=$" .env 2>/dev/null; then
    echo "Generating application key..."
    php artisan key:generate --force
fi

mkdir -p storage/framework/cache/data storage/framework/sessions storage/framework/views storage/logs
chmod -R 775 storage bootstrap/cache 2>/dev/null || true

php artisan migrate --force 2>/dev/null || true

exec php-fpm
