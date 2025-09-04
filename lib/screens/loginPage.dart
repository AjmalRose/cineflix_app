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
      backgroundColor: Color(0xFF0D0D0D),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "cineflix",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Stream • Discover • Enjoy",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 30),

              // Card Section
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Join millions of movie lovers",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 20),

                    inputField("Full Name", nameCtrl),
                    SizedBox(height: 15),
                    inputField("Email", emailCtrl),
                    SizedBox(height: 15),
                    inputField("Password", passCtrl, true),
                    SizedBox(height: 15),
                    inputField("Confirm Password", confirmCtrl, true),

                    SizedBox(height: 15),
                    mainButton(context, "Create Account"),

                    SizedBox(height: 15),
                    Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.grey),
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
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(color: Colors.red),
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
