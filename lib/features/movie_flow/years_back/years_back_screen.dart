import 'package:flutter/material.dart';

import 'package:show_recommender_app/core/constants.dart';
import 'package:show_recommender_app/core/widgets/primary_button.dart';
import 'package:show_recommender_app/features/movie_flow/result/result_screen.dart';

class YearsBackScreen extends StatefulWidget {
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  const YearsBackScreen(
      {Key? key, required this.previousPage, required this.nextPage})
      : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<YearsBackScreen> {
  double yearsBack = 10;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: widget.previousPage),
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
                  "${yearsBack.ceil()}",
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
              value: yearsBack,
              onChanged: (value) => setState(() {
                yearsBack = value;
              }),
              min: 0,
              max: 70,
              divisions: 70,
              label: "${yearsBack.ceil()}",
            ),
            const Spacer(),
            PrimaryButton(
              text: "Results",
              onPressed: () => Navigator.of(context).push(ResultScreen.route()),
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
