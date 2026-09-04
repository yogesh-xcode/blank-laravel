# Blank Laravel

Laravel 13 API starter kit

## Use this template

Click **"Use this template"** on GitHub to create a new repo from this starter.

## Setup (Local)

Requires PHP 8.3+ and PostgreSQL.

    git clone <your-new-repo>
    cd <your-new-repo>
    composer install
    cp .env.example .env
    php artisan key:generate
    php artisan migrate

## Run (Local)

    php artisan serve

## Docker

    docker compose up -d --build
    docker compose exec app bash
    php artisan key:generate
    php artisan migrate
