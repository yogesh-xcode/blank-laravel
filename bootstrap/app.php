<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Http\Middleware\HandleInertiaRequests;

$basepath = __DIR__;

return Application::configure(basePath: dirname($basepath))
  ->withRouting(
    web: $basepath . "/../routes/web.php",
    commands: $basepath . "/../routes/console.php",
    health: "/up",
  )
  ->withMiddleware(function (Middleware $middleware) {
    $middleware->web(append: [HandleInertiaRequests::class]);
  })
  ->withExceptions(function (Exceptions $exceptions) {})
  ->create();
