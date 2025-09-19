import 'package:cineflix_app/constants/text_constants.dart';
import 'package:cineflix_app/screens/cine_Flix_homePage.dart';
import 'package:cineflix_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/services/shared_prefs.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _usernameController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      // Save login data
      await SharedPrefs.setUsername(username);
      await SharedPrefs.setLoginStatus(true);

      //  Navigate to bottom nav
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BottomNavBar()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter username & password")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: AppFonts.appbarFont.copyWith(
                color: ColorsConstants.ColorWhite,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _usernameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsConstants.ColorWhite),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: LoginColors.colorRed),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsConstants.ColorWhite),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: LoginColors.colorRed),
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: LoginColors.colorRed,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: _login,
              child: Text(
                "Login",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
