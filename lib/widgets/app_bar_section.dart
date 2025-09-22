import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/image_constants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:cineflix_app/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Only cineFlix text
          Text(
            LoginText().cineFlix,
            style: AppFonts.appbarFont.copyWith(color: LoginColors.colorRed),
          ),
          // Profile icon
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AppImages.appBarImage),
            ),
          ),
        ],
      ),
    );
  }
}
