import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

import 'package:show_recommender_app/features/movie_flow/genre/genre.dart';

@immutable
class Movie extends Equatable {
  final String title;
  final String overview;
  final num voteAverage;
  final List<Genre> genres;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const Movie({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  Movie.initial()
      : title = "",
        overview = "",
        voteAverage = 0,
        genres = [],
        releaseDate = "",
        backdropPath = "",
        posterPath = "";

  String get genresCommaSeparated =>
      genres.map((e) => e.name).toList().join(", ");

  @override
  String toString() {
    return "Movie(title: $title, overview: $overview, voteAvg: $voteAverage, genres: $genres, releasedate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath";
  }

  @override
  List<Object> get props => [title, overview, voteAverage, genres, releaseDate];
}