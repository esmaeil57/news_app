import 'package:flutter/material.dart';
import 'package:news_app/layout/home.dart';
import 'package:news_app/layout/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName:(_) => const SplashScreen() ,
      },
    );
  }
}
