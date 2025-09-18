import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:flutter/material.dart';

Widget inputField({
  required String hint,
  required TextEditingController controller,
  bool isPassword = false,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 12),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(
        color: ColorsConstants.ColorBlack,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: LoginColors.darkRed),
        filled: true,
        fillColor: LoginColors.colorgrey,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget mainButton({required String text, required VoidCallback onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: LoginColors.darkRed,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: ColorsConstants.ColorWhite,
        ),
      ),
    ),
  );
}

Widget socialButton(IconData icon) {
  return CircleAvatar(
    backgroundColor: LoginColors.darkRed,
    radius: 30,
    child: Icon(icon, color: LoginColors.bluecolor),
  );
}
