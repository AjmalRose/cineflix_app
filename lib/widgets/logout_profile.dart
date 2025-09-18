import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:cineflix_app/screens/loginPage.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> _logout(BuildContext context) async {
    await SharedPrefs.setLoginStatus(false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _logout(context),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(Icons.logout, color: LoginColors.colorRed),
            SizedBox(width: 15),
            Text(
              "Logout",
              style: AppFonts.logout.copyWith(color: LoginColors.colorRed),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: LoginColors.colorgrey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
