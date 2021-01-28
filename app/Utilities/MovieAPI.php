<?php


namespace App\Utilities;


class MovieAPI extends BaseAPI {

    static function getHeaders() {
        return [
            "Accept" => "application/json",
            "Content-Type" => "application/json"
        ];
    }

    static function getAPIKey() {
        return "?api_key=" . env('MOVIE_API_KEY');
    }

    static function getUpcoming() {
        $url = env("MOVIE_API_BASE_URL") . "3/movie/upcoming" . self::getAPIKey();
        $data = self::get($url, self::getHeaders());

        if(!$data) {
            // error found, $data is null
            return [];
        }

        // Decode the JSON string from the API
        $data = json_decode($data);

        if(property_exists($data, 'results')) {
            return $data->results;
        }

        return [];
    }

    static function getTrending() {
        $url = env("MOVIE_API_BASE_URL") . "3/trending/movie/week" . self::getAPIKey();
        $data = self::get($url, self::getHeaders());

        if(!$data) {
            // error found, $data is null
            return [];
        }

        // Decode the JSON string from the API
        $data = json_decode($data);

        if(property_exists($data, 'results')) {
            return $data->results;
        }

        return [];
    }

}
