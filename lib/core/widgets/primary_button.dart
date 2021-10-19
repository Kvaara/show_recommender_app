import 'package:flutter/material.dart';

import 'package:show_recommender_app/core/constants.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final bool isLoading;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    this.text = "Lorem Ipsum",
    this.width = double.infinity,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius / 2),
          ),
          fixedSize: Size(width, 48),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
              )
            else
              Text(
                text,
                style: Theme.of(context).textTheme.button,
              ),
          ],
        ),
      ),
    );
  }
}
