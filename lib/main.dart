import 'screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CineflixApp());
}

class CineflixApp extends StatelessWidget {
  const CineflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen(),
    );
  }
}
