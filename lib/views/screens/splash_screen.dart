import 'dart:async';

import 'package:e_commerce_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changePage() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacementNamed(MyRoutes.intro);
      timer.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    changePage();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        body: Shimmer.fromColors(
          baseColor: Colors.brown,
          highlightColor: Colors.grey.shade50,
          direction: ShimmerDirection.ttb,
          loop: 3,
          child: Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  "assets/logo/logo.png",
                ),
              )),
            ),
          ),
        ),
      ),
    );

    //Center(
    //           child: Container(
    //         height: double.infinity,
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //             image: DecorationImage(
    //           image: AssetImage(
    //             "assets/logo/logo.png",
    //           ),
    //         )),
    //       )),
  }
}
