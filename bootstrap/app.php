<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

$basepath = __DIR__;

return Application::configure(basePath: dirname($basepath))
  ->withRouting(
    api: $basepath . "/../routes/api.php",
    commands: $basepath . "/../routes/console.php",
    health: "/up",
  )
  ->withMiddleware(function (Middleware $middleware) {})
  ->withExceptions(function (Exceptions $exceptions) {})
  ->create();
