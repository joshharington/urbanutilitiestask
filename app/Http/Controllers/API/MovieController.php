<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Watchlist;
use App\Utilities\MovieAPI;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class MovieController extends Controller {

    function getUpcoming() {
        $data = MovieAPI::getUpcoming();
        return response()->json(['data' => $data]);
    }

    function getTrending() {
        $data = MovieAPI::getTrending();
        return response()->json(['data' => $data]);
    }

}
