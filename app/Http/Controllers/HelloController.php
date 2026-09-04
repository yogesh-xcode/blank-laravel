<?php

namespace App\Http\Controllers;

use Inertia\Inertia;

class HelloController extends Controller
{
  public function show()
  {
    return Inertia::render("Hello/Hello", [
      "title" => "hello",
    ]);
  }
}
