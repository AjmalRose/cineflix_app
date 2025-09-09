import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/fonts_constants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:cineflix_app/widgets/login_widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();

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

              // Card Section
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

                    inputField(LoginText.fullName, nameCtrl),
                    SizedBox(height: 15),
                    inputField(LoginText.email, emailCtrl),
                    SizedBox(height: 15),
                    inputField(LoginText.password, passCtrl, true),
                    SizedBox(height: 15),
                    inputField(LoginText.confirmPassword, confirmCtrl, true),
                    SizedBox(height: 15),
                    mainButton(context, "Create Account"),

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
