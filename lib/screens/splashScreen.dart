import 'dart:async';
import 'package:cineflix_app/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:cineflix_app/screens/loginPage.dart';
import 'package:cineflix_app/widgets/bottom_nav_bar.dart';
import 'package:cineflix_app/services/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _loadSessionAndNavigate();
  }

  Future<void> _loadSessionAndNavigate() async {
    isLoggedIn = await SharedPrefs.getLoginStatus();

    // Wait 3 seconds for splash effect
    Timer(Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => isLoggedIn ? BottomNavBar() : LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.SplashScreenImage),
            SizedBox(height: 20),
            Text(
              TextConstants().splashwelcome,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
