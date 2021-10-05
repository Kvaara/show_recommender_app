import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:show_recommender_app/core/constants.dart';
import 'package:show_recommender_app/core/widgets/primary_button.dart';
import 'package:show_recommender_app/features/movie_flow/genre/list_card.dart';
import 'package:show_recommender_app/features/movie_flow/movie_flow_controller.dart';

class GenreScreen extends ConsumerWidget {
  const GenreScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed:
              ref.read(movieFlowControllerProvider.notifier).previousPage,
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
                  final genre =
                      ref.watch(movieFlowControllerProvider).genres[index];
                  return ListCard(
                    genre: genre,
                    onTap: () => ref
                        .read(movieFlowControllerProvider.notifier)
                        .toggleSelected(genre),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: kListItemSpacing,
                ),
                itemCount: ref.watch(movieFlowControllerProvider).genres.length,
              ),
            ),
            PrimaryButton(
                text: "Continue",
                onPressed:
                    ref.read(movieFlowControllerProvider.notifier).nextPage),
            const SizedBox(
              height: kMediumSpacing,
            )
          ],
        ),
      ),
    );
  }
}
