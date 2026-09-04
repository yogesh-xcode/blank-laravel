# Blank Laravel

Laravel 13 starter kit with Inertia.js, React 19, TypeScript, and PostgreSQL.

## Use this template

Click **"Use this template"** on GitHub to create a new repo from this starter.

## Tech Stack

- **Backend**: Laravel 13, PHP 8.3, PostgreSQL 16
- **Frontend**: Inertia.js v3, React 19, TypeScript, Vite 8
- **DevOps**: Docker, nginx, pnpm

## Setup (Local)

Requires PHP 8.3+ with extensions: `pdo_pgsql`, `gd`, `zip`, `intl`.
Requires Node.js 22+ and pnpm.
Requires PostgreSQL (or use Docker for the database).

    git clone <your-new-repo>
    cd <your-new-repo>

    # Backend
    composer install
    cp .env.example .env
    php artisan key:generate
    php artisan migrate

    # Frontend
    pnpm install

## Run (Local)

Run two terminals:

    # Terminal 1 — Laravel (http://localhost:8000)
    php artisan serve

    # Terminal 2 — Vite dev server (HMR + assets)
    pnpm dev

Open http://localhost:8000 in your browser.

## Build for Production

    pnpm build

This compiles frontend assets to `public/build/`.

## Docker

    docker compose up -d --build

The app is available at http://localhost:8000.

Docker runs the full stack: nginx, PHP-FPM, PostgreSQL, and builds frontend assets automatically.
