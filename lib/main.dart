import 'package:flutter/material.dart';
import 'package:cineflix_app/screens/splashScreen.dart';
import 'package:cineflix_app/services/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await SharedPrefs.getLoginStatus();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen(isLoggedIn: isLoggedIn),
    );
  }
}
