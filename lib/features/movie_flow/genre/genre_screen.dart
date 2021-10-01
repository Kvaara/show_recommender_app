import 'package:flutter/material.dart';

import 'package:show_recommender_app/core/constants.dart';
import 'genre.dart';
import 'package:show_recommender_app/core/widgets/primary_button.dart';
import 'package:show_recommender_app/features/movie_flow/genre/list_card.dart';

class GenreScreen extends StatefulWidget {
  final VoidCallback previousPage;
  final VoidCallback nextPage;
  const GenreScreen({
    Key? key,
    required this.previousPage,
    required this.nextPage,
  }) : super(key: key);

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = const [
    Genre(name: "Action"),
    Genre(name: "Comedy"),
    Genre(name: "Horror"),
    Genre(name: "Anime"),
    Genre(name: "Drama"),
    Genre(name: "Family"),
    Genre(name: "Romance"),
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        // This is why we overrode the == operator (and the hashcode)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre
    ];
    setState(() {
      genres = updatedGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Select the genre(s)",
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: kListItemSpacing),
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () => toggleSelected(genre),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: kListItemSpacing,
                ),
                itemCount: genres.length,
              ),
            ),
            PrimaryButton(text: "Continue", onPressed: widget.nextPage),
            const SizedBox(
              height: kMediumSpacing,
            )
          ],
        ),
      ),
    );
  }
}
