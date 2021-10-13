import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:show_recommender_app/features/movie_flow/genre/genre.dart';
import 'package:show_recommender_app/features/movie_flow/movie_repository.dart';
import 'package:show_recommender_app/features/movie_flow/result/movie.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return TMDBMovieService(movieRepository);
});

abstract class MovieService {
  Future<List<Genre>> getGenres();
  Future<Movie> getRecommendedMovie(
    int rating,
    int yearsBack,
    List<Genre> genres, [
    DateTime? yearsBackFromDate,
  ]);
}

class TMDBMovieService implements MovieService {
  final MovieRepository _movieRepository;
  TMDBMovieService(this._movieRepository);

  @override
  Future<List<Genre>> getGenres() async {
    final GenreEntities = await _movieRepository.getMovieGenres();
    final genres =
        GenreEntities.map((element) => Genre.fromEntity(element)).toList();
    return genres;
  }

  @override
  Future<Movie> getRecommendedMovie(
    int rating,
    int yearsBack,
    List<Genre> genres, [
    DateTime? yearsBackFromDate,
  ]) async {
    final date = yearsBackFromDate ?? DateTime.now();
    final year = date.year - yearsBack;
    final genreIds = genres.map((element) => element.id).toList().join(",");
    final movieEntities = await _movieRepository.getRecommendedMovies(
        rating.toDouble(), "$year-01-01", genreIds);
    final movies = movieEntities
        .map((element) => Movie.fromEntity(element, genres))
        .toList();
    final rnd = Random();
    final randomMovie = movies[rnd.nextInt(movies.length)];
    return randomMovie;
  }
}
