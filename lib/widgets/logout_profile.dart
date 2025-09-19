import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:cineflix_app/screens/loginPage.dart';

class LogoutProfile extends StatelessWidget {
  const LogoutProfile({super.key});

  Future<void> _logout(BuildContext context) async {
    await SharedPrefs.clearUser();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.logout, color: LoginColors.colorRed),
      title: Text(
        "Logout",
        style: AppFonts.logout.copyWith(color: LoginColors.colorRed),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: LoginColors.colorgrey,
        size: 16,
      ),
      onTap: () => _logout(context),
    );
  }
}
