import 'package:cineflix_app/screens/cine_Flix_homePage.dart';
import 'package:cineflix_app/services/shared_prefs.dart';
import 'package:cineflix_app/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

Widget inputField(
  String hint,
  TextEditingController controller, [
  bool isPass = false,
]) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: TextField(
      controller: controller,
      obscureText: isPass,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFF2A2A2A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget mainButton(BuildContext context, String text) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[700],
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      onPressed: () async {
        await SharedPrefs.setLoginStatus(true); // 🔥 Save login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
        );
      },
      child: Text(text),
    ),
  );
}

Widget socialButton(IconData icon) {
  return CircleAvatar(
    backgroundColor: Color(0xFF2A2A2A),
    radius: 22,
    child: Icon(icon, color: Colors.white),
  );
}
