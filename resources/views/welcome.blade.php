@extends('layouts.app')
@section('content')
    <movie-list movie_image_base_url="{{ env('MOVIE_IMAGE_BASE_URL') }}" endpoint="{{ route('api.movies.upcoming') }}" title="Upcoming Movies" auth_check="{{ auth()->check() }}">
@endsection
