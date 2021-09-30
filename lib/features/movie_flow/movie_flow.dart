import 'package:flutter/material.dart';
import 'package:show_recommender_app/features/movie_flow/landing/landing_screen.dart';

class MovieFlow extends StatefulWidget {
  const MovieFlow({Key? key}) : super(key: key);

  @override
  _MovieFlowState createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  PageController pageController = PageController();

  void nextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  // We dispose of the pageController to prevent possible memory leaks
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        LandingScreen(nextPage: nextPage, previousPage: previousPage),
        Scaffold(body: Container(color: Colors.red)),
        Scaffold(body: Container(color: Colors.brown)),
        Scaffold(body: Container(color: Colors.black)),
      ],
    );
  }
}
