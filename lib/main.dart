import 'package:e_commerce_app/controllers/api_controller.dart';
import 'package:e_commerce_app/controllers/cart_db_controller.dart';
import 'package:e_commerce_app/controllers/like_controllar.dart';
import 'package:e_commerce_app/utils/routes.dart';
import 'package:e_commerce_app/views/screens/Intro-page.dart';
import 'package:e_commerce_app/views/screens/cart_page.dart';
import 'package:e_commerce_app/views/screens/detail_page.dart';
import 'package:e_commerce_app/views/screens/home_page.dart';
import 'package:e_commerce_app/views/screens/like_page.dart';
import 'package:e_commerce_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ApiController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LikeControllar(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.splash,
      routes: {
        MyRoutes.splash: (context) => SplashScreen(),
        MyRoutes.intro: (context) => ExamplePage(),
        MyRoutes.home: (context) => HomePage(),
        MyRoutes.detail: (context) => DetailPage(),
        MyRoutes.cart: (context) => CartPage(),
        MyRoutes.like: (context) => LikePage(),
      },
    );
  }
}
