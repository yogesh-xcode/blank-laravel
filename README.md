# Blank Laravel

Laravel 13 API starter kit

## Use this template

Click **"Use this template"** on GitHub to create a new repo from this starter.

## Setup

    git clone <your-new-repo>
    cd <your-new-repo>
    composer install
    cp .env.example .env
    php artisan key:generate
    php artisan migrate

## Run

    php artisan serve

## Docker

    docker compose up -d --build
    docker compose exec app bash
    composer install
    php artisan key:generate
    php artisan migrate
