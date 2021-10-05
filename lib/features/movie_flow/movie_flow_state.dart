import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

import 'package:show_recommender_app/features/movie_flow/result/movie.dart';
import 'package:show_recommender_app/features/movie_flow/genre/genre.dart';

const genresMock = [
  Genre(name: "Action"),
  Genre(name: "Comedy"),
  Genre(name: "Horror"),
  Genre(name: "Anime"),
  Genre(name: "Drama"),
  Genre(name: "Family"),
  Genre(name: "Romance"),
];

const movieMock = Movie(
  title: "The hulk",
  overview: "Bruce banner a genetics overview",
  voteAverage: 4.8,
  genres: [Genre(name: "Action"), Genre(name: "Fantasy")],
  releaseDate: "2019-05-24",
  backdropPath: "",
  posterPath: "",
);

@immutable
class MovieFlowState extends Equatable {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final List<Genre> genres;
  final Movie movie;

  const MovieFlowState({
    required this.pageController,
    this.rating = 5,
    this.yearsBack = 10,
    this.genres = genresMock,
    this.movie = movieMock,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    List<Genre>? genres,
    Movie? movie,
  }) {
    return MovieFlowState(
      pageController: pageController ?? this.pageController,
      rating: rating ?? this.rating,
      yearsBack: yearsBack ?? this.yearsBack,
      genres: genres ?? this.genres,
      movie: movie ?? this.movie,
    );
  }

  // Overriding both the == operator and the hashCode by using Equatable
  @override
  List<Object> get props => [pageController, rating, yearsBack, genres, movie];
}
