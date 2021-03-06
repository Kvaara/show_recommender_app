import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:show_recommender_app/core/constants.dart';
import 'package:show_recommender_app/core/widgets/primary_button.dart';
import 'package:show_recommender_app/features/movie_flow/movie_flow_controller.dart';
import 'package:show_recommender_app/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends ConsumerWidget {
  const YearsBackScreen({Key? key}) : super(key: key);

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
              "Show results from\nhow many years back?",
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${ref.watch(movieFlowControllerProvider).yearsBack}",
                  style: theme.textTheme.headline2,
                ),
                Text(
                  " years back",
                  style: theme.textTheme.headline4?.copyWith(
                    color: theme.textTheme.headline4?.color?.withOpacity(0.62),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Slider(
              value:
                  ref.watch(movieFlowControllerProvider).yearsBack.toDouble(),
              onChanged: (value) => ref
                  .read(movieFlowControllerProvider.notifier)
                  .updateYearsBack(value.toInt()),
              min: 0,
              max: 70,
              divisions: 70,
              label: "${ref.watch(movieFlowControllerProvider).yearsBack}",
            ),
            const Spacer(),
            PrimaryButton(
              text: "Results",
              onPressed: () async {
                await ref
                    .read(movieFlowControllerProvider.notifier)
                    .getRecommendedMovie();
                Navigator.of(context).push(ResultScreen.route());
              },
              isLoading:
                  ref.watch(movieFlowControllerProvider).movie is AsyncLoading,
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
