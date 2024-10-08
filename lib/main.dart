import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:clean_air/screens/HomePage.dart';
import 'package:clean_air/screens/navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3000,
        backgroundColor: Colors.white,
        splash: const Image(image: AssetImage("assets/logo.png")),
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: navigation(),)
    
    );
  }
}




