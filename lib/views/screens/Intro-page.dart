import 'package:animated_introduction/animated_introduction.dart';
import 'package:e_commerce_app/utils/routes.dart';
import 'package:flutter/material.dart';

final List<SingleIntroScreen> pages = [
  const SingleIntroScreen(
    title: 'Welcome to the Event Management App !',
    description:
        'You plans your Events, We\'ll do the rest and will be the best! Guaranteed!  ',
    imageAsset: 'assets/images/images-phone.png',
    mainCircleBgColor: Colors.brown,
    sideDotsBgColor: Colors.brown,
  ),
  const SingleIntroScreen(
    title: 'Book tickets to cricket matches and events',
    description:
        'Tickets to the latest movies, crickets matches, concerts, comedy shows, plus lots more !',
    imageAsset: 'assets/images/shoping.png',
    mainCircleBgColor: Colors.brown,
    sideDotsBgColor: Colors.brown,
  ),
  const SingleIntroScreen(
    title: 'Grabs all events now only in your hands',
    description: 'All events are now in your hands, just a click away ! ',
    imageAsset: 'assets/images/images.png',
    sideDotsBgColor: Colors.brown,
    mainCircleBgColor: Colors.brown,
    centerBallRadius: 12.0,
  ),
];

/// Example page
class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedIntroduction(
      slides: pages,
      footerBgColor: Colors.black87,
      indicatorType: IndicatorType.circle,
      onDone: () {
        Navigator.of(context).pushNamed(MyRoutes.home);
      },
    );
  }
}
