import 'package:cineflix_app/screens/editProfile.dart';
import 'package:flutter/material.dart';
import 'package:cineflix_app/models/user_model.dart';
import 'package:cineflix_app/services/user_service.dart';
import 'package:cineflix_app/widgets/logout_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final fetchedUser = await UserService.getUser();
    setState(() => user = fetchedUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: user == null
            ? const Center(
                child: Text(
                  "No user found",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/profile.jpg"),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      user!.fullName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user!.email,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    _buildOption(
                      Icons.edit,
                      "Edit Profile",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditProfileScreen(user: user),
                        ),
                      ).then((_) => _loadUser()), // Refresh data after editing
                    ),
                    _buildOption(Icons.notifications, "Notifications"),
                    _buildOption(Icons.settings, "Settings"),
                    _buildOption(Icons.help_outline, "Help & Support"),
                    const LogoutButton(),
                    const SizedBox(height: 30),
                    const Text(
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
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 15),
            Text(text, style: TextStyle(color: color, fontSize: 18)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
          ],
        ),
      ),
    );
  }
}
