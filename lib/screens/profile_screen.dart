import 'package:flutter/material.dart';
import 'package:cineflix_app/widgets/logout_profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              SizedBox(height: 15),

              Text(
                "Ajmal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),

              Text(
                "ajmal03@gmail.com",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 30),

              _buildOption(Icons.edit, "Edit Profile"),
              _buildOption(Icons.notifications, "Notifications"),
              _buildOption(Icons.settings, "Settings"),
              _buildOption(Icons.help_outline, "Help & Support"),

              //  Reusable Logout Widget
              LogoutButton(),

              SizedBox(height: 30),
              Text(
                "Version 1.0.0",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(
    IconData icon,
    String text, {
    Color color = Colors.white,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 15),
          Text(text, style: TextStyle(color: color, fontSize: 18)),
          Spacer(),
          Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        ],
      ),
    );
  }
}
