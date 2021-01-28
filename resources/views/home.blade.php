@extends('layouts.app')

@section('content')
    <movie-list movie_image_base_url="{{ env('MOVIE_IMAGE_BASE_URL') }}" endpoint="{{ route('api.movies.upcoming') }}" title="Upcoming" auth_check="{{ auth()->check() }}" limit="4"></movie-list>
    <movie-list movie_image_base_url="{{ env('MOVIE_IMAGE_BASE_URL') }}" endpoint="{{ route('api.movies.trending') }}" title="Trending" auth_check="{{ auth()->check() }}" limit="8"></movie-list>
@endsection
