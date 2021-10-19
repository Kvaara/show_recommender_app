import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:show_recommender_app/features/movie_flow/result/movie.dart';
import 'package:show_recommender_app/features/movie_flow/genre/genre.dart';

@immutable
class MovieFlowState extends Equatable {
  final PageController pageController;
  final int rating;
  final int yearsBack;
  final AsyncValue<List<Genre>> genres;
  final AsyncValue<Movie> movie;

  const MovieFlowState({
    required this.pageController,
    this.rating = 5,
    this.yearsBack = 10,
    required this.genres,
    required this.movie,
  });

  MovieFlowState copyWith({
    PageController? pageController,
    int? rating,
    int? yearsBack,
    AsyncValue<List<Genre>>? genres,
    AsyncValue<Movie>? movie,
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
