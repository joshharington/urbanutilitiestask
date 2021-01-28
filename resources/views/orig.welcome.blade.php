<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- CSRF Token -->
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Scripts -->
        <script src="{{ asset('js/app.js') }}" defer></script>

        <!-- Fonts -->
        <link rel="dns-prefetch" href="//fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

        <!-- Styles -->
        <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    </head>
    <body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            @if (Route::has('login'))
                <div class="top-right links">
                    @auth
                        <a href="{{ url('/home') }}">Home</a>
                    @else
                        <a href="{{ route('login') }}">Login</a>

                        @if (Route::has('register'))
                            <a href="{{ route('register') }}">Register</a>
                        @endif
                    @endauth
                </div>
            @endif
        </nav>

{{--        <div class="flex-center position-ref full-height">--}}
            <div class="content">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">{{ __('Upcomming Movies') }}</div>

                                <div class="card-body">
                                    @if(count($upcomingData) == 0)
                                        <p>There are no upcoming movies currently.</p>
                                    @endif
                                    <div class="row">
                                        @foreach($upcomingData as $ud)
                                            <div class="col-md-3 mb-3">
                                                <div class="card">
                                                    <img src="{{ env("MOVIE_IMAGE_BASE_URL") . $ud->poster_path }}" class="card-img-top" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">{{ $ud->original_title }}</h5>
                                                        <small class="text-muted">Release Date: {{ $ud->release_date }}</small>
                                                        <p class="card-text">{{ $ud->overview }}</p>
{{--                                                        <a href="#" class="btn btn-primary">Add to Watchlist</a>--}}
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
{{--        </div>--}}
    </div>
    </body>
</html>
