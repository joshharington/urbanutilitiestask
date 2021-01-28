<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Watchlist;
use Illuminate\Http\Request;

class WatchlistController extends Controller {

    function index() {
        $user = auth()->user();

        // Get all movie ID's this user has added to their watch list
        $watchlists = self::_getWatchLists($user->id);

        return response()->json(['watchlist' => $watchlists]);
    }

    function store(Request $request) {
        $user = auth()->user();
        $movieId = $request->get('movie_id');

        $watchlist = new Watchlist;
        $watchlist->movie_id = $movieId;
        $watchlist->user_id = $user->id;
        $watchlist->save();

        $watchlists = self::_getWatchLists($user->id);
        return response()->json(['watchlist' => $watchlists]);
    }

    function delete($movieId) {
        $user = auth()->user();
        $watchList = Watchlist::where('movie_id', $movieId)->where('user_id', $user->id)->first();

        if($watchList) {
            // Movie is in watchlist. Delete from users' watchlist.
            $watchList->delete();
        }

        // Can add an error if movie was not in watchlist here.

        $watchlists = self::_getWatchLists($user->id);

        return response()->json(['watchlist' => $watchlists]);
    }

    static function _getWatchLists($user_id) {
        return Watchlist::where('user_id', $user_id)->pluck('movie_id');
    }

}
