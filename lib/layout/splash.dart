import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/layout/home.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "splash" ;
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay transition to main screen for 1 seconds
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset("assets/images/splash.png")
    );
  } }