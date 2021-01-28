<?php

namespace App\Http\Controllers;

use App\Utilities\MovieAPI;
use Illuminate\Http\Request;

class WelcomeController extends Controller {

    public function index() {
        $upcomingData = MovieAPI::getUpcoming();

        $authenticated = auth()->check();

        return view('welcome', ['upcomingData' => $upcomingData, 'authenticated' => $authenticated]);
    }

}
