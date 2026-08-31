<?php

use Illuminate\Http\Request;

define("LARAVEL_START", microtime(true));

// 1. Check: if the application in the maintenance mode at the earliest before load the app
if (
  file_exists($maintenance = __DIR__ . "/../storage/framework/maintenance.php")
) {
  require $maintenance;
}

// 2. Register the Composer Autoloader (load App Classes)
require __DIR__ . "/../vendor/autoload.php";

// 3. Bootstrap the Application
$app = require_once __DIR__ . "/../bootstrap/app.php";

// 4. Handle Incoming Http Request and return the response
$app->handleRequest(Request::capture());
