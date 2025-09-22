// logout_profile.dart
import 'package:flutter/material.dart';
import 'package:cineflix_app/screens/signInPage.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:cineflix_app/services/current_user_notifier.dart';

class LogoutProfile extends StatelessWidget {
  const LogoutProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _handleLogout(context),
      icon: const Icon(Icons.logout),
      label: const Text("Logout"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _handleLogout(BuildContext context) async {
    // ✅ Only clear session info (username + login status)
    await SharedPrefs.setLoginStatus(false);
    await SharedPrefs.setUsername('');

    // Reset notifier
    currentUserNotifier.value = null;

    // Navigate back to SignIn page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SignInPage()),
    );
  }
}
