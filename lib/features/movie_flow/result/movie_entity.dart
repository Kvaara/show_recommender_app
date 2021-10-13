import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String overview;
  final num voteAverage;
  final List<int> genreIds;
  final String releaseDate;
  final String? backdropPath;
  final String? posterPath;

  const MovieEntity({
    required this.title,
    required this.overview,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
    this.backdropPath,
    this.posterPath,
  });

  factory MovieEntity.fromMap(Map<String, dynamic> data) => MovieEntity(
        title: data["title"],
        overview: data["overview"],
        voteAverage: data["vote_average"],
        genreIds: List.from(data["genre_ids"]),
        releaseDate: data["release_date"],
        backdropPath: data["backdrop_path"],
        posterPath: data["poster_path"],
      );

  @override
  List<Object?> get props => [
        title,
        overview,
        voteAverage,
        genreIds,
        releaseDate,
        backdropPath,
        posterPath,
      ];

  @override
  String toString() =>
      "MovieEntity(title: $title, overview: $overview, voteAverage: $voteAverage, genreIds: $genreIds, releaseDate: $releaseDate, backdropPath: $backdropPath, posterPath: $posterPath,";
}
