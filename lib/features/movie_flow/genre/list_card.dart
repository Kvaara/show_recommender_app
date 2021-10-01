import 'package:flutter/material.dart';

import 'package:show_recommender_app/features/movie_flow/genre/genre.dart';
import 'package:show_recommender_app/core/constants.dart';

class ListCard extends StatelessWidget {
  final Genre genre;
  final VoidCallback onTap;

  const ListCard({Key? key, required this.genre, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return UnconstrainedBox(
      child: Material(
          color:
              genre.isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(kBorderRadius),
          child: InkWell(
            borderRadius: BorderRadius.circular(kBorderRadius),
            onTap: onTap,
            child: Container(
              width: 140,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                genre.name,
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}
