import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:cineflix_app/services/user_service.dart';
import 'package:cineflix_app/models/user_model.dart';
import 'package:cineflix_app/widgets/login_widgets.dart';
import 'package:cineflix_app/widgets/bottom_nav_bar.dart';
import 'package:cineflix_app/screens/signInPage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  Future<void> _handleSignup(BuildContext context) async {
    final name = nameCtrl.text.trim();
    final email = emailCtrl.text.trim();
    final pass = passCtrl.text.trim();
    final confirm = confirmCtrl.text.trim();

    if (name.isEmpty || email.isEmpty || pass.isEmpty || confirm.isEmpty) {
      _showError(context, "Please fill all fields");
      return;
    }

    if (pass != confirm) {
      _showError(context, "Passwords do not match");
      return;
    }

    final user = UserModel(fullName: name, email: email, password: pass);

    // Hive: save new user
    final success = await UserService.saveUser(user);
    if (!success) {
      _showError(context, "Account already exists!");
      return;
    }

    // Save session
    await SharedPrefs.setUsername(email);
    await SharedPrefs.setLoginStatus(true);

    // Navigate to home
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => BottomNavBar()),
    );
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: LoginColors.colorRed),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                LoginText().cineFlix,
                style: TextStyle(
                  color: ColorsConstants.ColorWhite,
                  fontSize: AppFonts.heading,
                  fontWeight: AppFonts.bold,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorsConstants.ColorBlack,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: AppFonts.createAccount,
                        fontWeight: FontWeight.bold,
                        color: ColorsConstants.ColorWhite,
                      ),
                    ),
                    SizedBox(height: 20),
                    inputField(hint: "Full Name", controller: nameCtrl),
                    SizedBox(height: 15),
                    inputField(hint: "Email", controller: emailCtrl),
                    SizedBox(height: 15),
                    inputField(
                      hint: "Password",
                      controller: passCtrl,
                      isPassword: true,
                    ),
                    SizedBox(height: 15),
                    inputField(
                      hint: "Confirm Password",
                      controller: confirmCtrl,
                      isPassword: true,
                    ),
                    SizedBox(height: 20),
                    mainButton(
                      text: "Create Account",
                      onPressed: () => _handleSignup(context),
                    ),
                    SizedBox(height: 15),
                    Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: LoginColors.colorgrey),
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(color: LoginColors.colorRed),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => SignInPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
