import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/fonts_constants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:cineflix_app/services/user_service.dart';
import 'package:cineflix_app/models/user_model.dart';
import 'package:cineflix_app/widgets/login_widgets.dart';
import 'package:cineflix_app/widgets/bottom_nav_bar.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

  Future<void> _handleLogin(BuildContext context) async {
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
    await UserService.saveUser(user); // save user
    await SharedPrefs.setLoginStatus(true); // save login state

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
          padding: EdgeInsets.all(16),
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
              SizedBox(height: 8),
              Text(
                LoginText.secondText,
                style: TextStyle(color: LoginColors.colorgrey),
              ),
              SizedBox(height: 30),

              Container(
                padding: EdgeInsets.all(20),
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
                    SizedBox(height: 50),
                    Text(
                      LoginText.fourthText,
                      style: TextStyle(color: LoginColors.colorgrey),
                    ),
                    SizedBox(height: 20),

                    // 🔹 Input Fields
                    inputField(hint: LoginText.fullName, controller: nameCtrl),
                    SizedBox(height: 15),
                    inputField(hint: LoginText.email, controller: emailCtrl),
                    SizedBox(height: 15),
                    inputField(
                      hint: LoginText.password,
                      controller: passCtrl,
                      isPassword: true,
                    ),
                    SizedBox(height: 15),
                    inputField(
                      hint: LoginText.confirmPassword,
                      controller: confirmCtrl,
                      isPassword: true,
                    ),
                    SizedBox(height: 15),

                    // 🔹 Main Button with  logic
                    mainButton(
                      text: "Create Account",
                      onPressed: () => _handleLogin(context),
                    ),

                    SizedBox(height: 15),
                    Text(
                      LoginText.orContinueWith,
                      style: TextStyle(color: LoginColors.colorgrey),
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        socialButton(Icons.g_mobiledata),
                        SizedBox(width: 10),
                        socialButton(Icons.apple),
                      ],
                    ),
                    SizedBox(height: 15),

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
