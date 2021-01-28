<?php

namespace App\Http\Controllers;

use App\Utilities\MovieAPI;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index() {

        $upcomingData = MovieAPI::getUpcoming();

        return view('home', ['upcomingData' => $upcomingData]);
    }
}
