import 'package:flutter/material.dart';

import 'package:show_recommender_app/core/constants.dart';
import 'package:show_recommender_app/core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback previousPage;
  final VoidCallback nextPage;

  const LandingScreen({
    Key? key,
    required this.previousPage,
    required this.nextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              "Let's find a movie",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Image.asset("images/undraw_horror_movie.png"),
            const Spacer(),
            PrimaryButton(
              onPressed: nextPage,
              text: "Get started",
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
