import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/fonts_constants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:cineflix_app/widgets/login_widgets.dart';
import 'package:cineflix_app/widgets/bottom_nav_bar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  Future<void> _handleLogin(BuildContext context) async {
    await SharedPrefs.setLoginStatus(true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const BottomNavBar()),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                LoginText().cineFlix,
                style: TextStyle(
                  color: ColorsConstants.ColorWhite,
                  fontSize: LoginFonts.heading,
                  fontWeight: LoginFonts.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                LoginText.secondText,
                style: TextStyle(color: LoginColors.colorgrey),
              ),
              const SizedBox(height: 30),

              // 🔹 Card Container
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorsConstants.ColorBlack,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Text(
                      LoginText.createAccount,
                      style: TextStyle(
                        fontSize: LoginFonts.createAccount,
                        fontWeight: FontWeight.bold,
                        color: ColorsConstants.ColorWhite,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      LoginText.fourthText,
                      style: TextStyle(color: LoginColors.colorgrey),
                    ),
                    const SizedBox(height: 20),

                    // 🔹 Input Fields
                    inputField(hint: LoginText.fullName, controller: nameCtrl),
                    const SizedBox(height: 15),
                    inputField(hint: LoginText.email, controller: emailCtrl),
                    const SizedBox(height: 15),
                    inputField(
                      hint: LoginText.password,
                      controller: passCtrl,
                      isPassword: true,
                    ),
                    const SizedBox(height: 15),
                    inputField(
                      hint: LoginText.confirmPassword,
                      controller: confirmCtrl,
                      isPassword: true,
                    ),
                    const SizedBox(height: 15),

                    // 🔹 Main Button
                    mainButton(
                      text: "Create Account",
                      onPressed: () => _handleLogin(context),
                    ),

                    const SizedBox(height: 15),
                    Text(
                      LoginText.orContinueWith,
                      style: TextStyle(color: LoginColors.colorgrey),
                    ),
                    const SizedBox(height: 10),

                    // 🔹 Social Login Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialButton(Icons.g_mobiledata),
                        const SizedBox(width: 10),
                        socialButton(Icons.apple),
                      ],
                    ),
                    const SizedBox(height: 15),

                    Text.rich(
                      TextSpan(
                        text: LoginText.textSpan,
                        style: TextStyle(color: LoginColors.colorgrey),
                        children: [
                          TextSpan(
                            text: LoginText.textSpan2,
                            style: TextStyle(color: LoginColors.colorRed),
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
