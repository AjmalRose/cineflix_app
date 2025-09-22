import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:flutter/material.dart';
import 'package:cineflix_app/widgets/bottom_nav_bar.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:cineflix_app/services/user_service.dart';
import 'package:cineflix_app/services/current_user_notifier.dart';
import 'package:cineflix_app/widgets/login_widgets.dart';
import 'package:cineflix_app/screens/loginPage.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  Future<void> _handleSignin(BuildContext context) async {
    final email = emailCtrl.text.trim();
    final pass = passCtrl.text.trim();

    if (email.isEmpty || pass.isEmpty) {
      _showError(context, "Please enter email & password");
      return;
    }

    final user = await UserService.validateUser(email, pass);
    if (user == null) {
      _showError(context, "Invalid email or password");
      return;
    }

    // ✅ Save current logged-in user in SharedPrefs
    await SharedPrefs.setUsername(email);
    await SharedPrefs.setLoginStatus(true);

    // ✅ Notify app of new current user
    currentUserNotifier.value = email;

    // Navigate to main app
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BottomNavBar()),
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: LoginColors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              inputField(hint: "Email", controller: emailCtrl),
              SizedBox(height: 15),
              inputField(
                hint: "Password",
                controller: passCtrl,
                isPassword: true,
              ),
              SizedBox(height: 20),
              mainButton(
                text: "Sign In",
                onPressed: () => _handleSignin(context),
              ),
              SizedBox(height: 20),

              // ✅ Create Account text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: LoginColors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
