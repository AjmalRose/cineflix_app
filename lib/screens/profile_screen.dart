import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Profile"), backgroundColor: Colors.red[700]),
      body: Center(
        child: Text(
          "User Profile",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
