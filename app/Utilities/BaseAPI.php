<?php


namespace App\Utilities;


use GuzzleHttp\Client;

class BaseAPI {

    static function get($endpoint, $headers) {
        $client = new Client();
        $res = $client->request('GET', $endpoint, ["headers" => $headers]);
        if($res->getStatusCode() == 200) {
            // Successful request, return result
            return $res->getBody()->getContents();
        }

        // There was an error, return null
        return null;
    }

}
