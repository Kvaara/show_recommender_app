import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:show_recommender_app/core/environment_variables.dart';
import 'package:show_recommender_app/features/movie_flow/genre/genre_entity.dart';
import 'package:show_recommender_app/features/movie_flow/result/movie_entity.dart';
import 'package:show_recommender_app/main.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return TMDBMovieRepository(dio: dio);
});

abstract class MovieRepository {
  Future<List<GenreEntity>> getMovieGenres();
  Future<List<MovieEntity>> getRecommendedMovies(
    double rating,
    String date,
    String genreIds,
  );
}

class TMDBMovieRepository implements MovieRepository {
  final Dio dio;
  TMDBMovieRepository({required this.dio});

  @override
  Future<List<GenreEntity>> getMovieGenres() async {
    final response = await dio.get(
      "genre/movie/list",
      queryParameters: {"api_key": apiKey, "language": "en-US"},
    );
    final results = List<Map<String, dynamic>>.from(response.data["genres"]);
    final genres =
        results.map((element) => GenreEntity.fromMap(element)).toList();

    return genres;
  }

  @override
  Future<List<MovieEntity>> getRecommendedMovies(
      double rating, String date, String genreIds) async {
    final response = await dio.get(
      "discover/movie",
      queryParameters: {
        "api_key": apiKey,
        "language": "en-US",
        "sort_by": "popularity.desc",
        "include_adult": true,
        "vote_average.gte": rating,
        "page": 1,
        "release_date.gte": date,
        "with_genres": genreIds,
      },
    );
    final results = List<Map<String, dynamic>>.from(response.data["results"]);
    final movies =
        results.map((element) => MovieEntity.fromMap(element)).toList();
    return movies;
  }
}
