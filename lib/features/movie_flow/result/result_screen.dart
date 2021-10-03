import 'package:flutter/material.dart';
import 'package:show_recommender_app/core/constants.dart';
import 'package:show_recommender_app/core/widgets/primary_button.dart';

import 'package:show_recommender_app/features/movie_flow/result/movie.dart';
import 'package:show_recommender_app/features/movie_flow/genre/genre.dart';

class ResultScreen extends StatelessWidget {
  final double movieHeight = 150;

  const ResultScreen({Key? key}) : super(key: key);

  // Pretty handy because we can use ResultScreen.route to immediately to navigate to this screen
  static MaterialPageRoute route({bool fullscreenDialog = true}) =>
      MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      );

  final movie = const Movie(
    title: "The hulk",
    overview: "Bruce banner a genetics overview",
    voteAverage: 4.8,
    genres: [Genre(name: "Action"), Genre(name: "Fantasy")],
    releaseDate: "2019-05-24",
    backdropPath: "",
    posterPath: "",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const CoverImage(),
                    Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: -(movieHeight / 2),
                      child: MovieImageDetails(
                        movie: movie,
                        movieHeight: movieHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: movieHeight / 2),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                )
              ],
            ),
          ),
          PrimaryButton(
            onPressed: () => Navigator.of(context).pop(),
            text: "Start a new search",
          ),
          const SizedBox(height: kMediumSpacing),
        ],
      ),
    );
  }
}

class CoverImage extends StatelessWidget {
  const CoverImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 298),
      child: ShaderMask(
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Colors.transparent
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height)),
        blendMode: BlendMode.dstIn,
        child: const Placeholder(),
      ),
    );
  }
}

class MovieImageDetails extends StatelessWidget {
  final double movieHeight;
  final Movie movie;

  const MovieImageDetails({
    Key? key,
    required this.movieHeight,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: movieHeight,
              child: const Placeholder(),
            ),
            const SizedBox(width: kMediumSpacing),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: theme.textTheme.headline6,
                  ),
                  Text(
                    movie.genresCommaSeparated,
                    style: theme.textTheme.bodyText2,
                  ),
                  Row(
                    children: [
                      Text(
                        "4.8",
                        style: theme.textTheme.bodyText2?.copyWith(
                          color: theme.textTheme.bodyText2?.color
                              ?.withOpacity(0.62),
                        ),
                      ),
                      const Icon(
                        Icons.star_rounded,
                        size: 20,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
