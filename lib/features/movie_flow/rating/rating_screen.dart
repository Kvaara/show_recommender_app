import 'package:flutter/material.dart';

import 'package:show_recommender_app/core/constants.dart';
import 'package:show_recommender_app/core/widgets/primary_button.dart';

class RatingScreen extends StatefulWidget {
  final VoidCallback previousPage;
  final VoidCallback nextPage;

  const RatingScreen(
      {Key? key, required this.previousPage, required this.nextPage})
      : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5.0;

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
              "Choose a minimum rating\n(0 - 10)",
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${rating.ceil()}",
                  style: theme.textTheme.headline2,
                ),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.yellow,
                  size: 62,
                ),
              ],
            ),
            const Spacer(),
            Slider(
              value: rating,
              onChanged: (value) => setState(() {
                rating = value;
              }),
              min: 1,
              max: 10,
              divisions: 9,
              label: "${rating.ceil()}",
            ),
            const Spacer(),
            PrimaryButton(
              text: "Continue",
              onPressed: widget.nextPage,
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
