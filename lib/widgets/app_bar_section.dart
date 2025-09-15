import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/image_constants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            LoginText().cineFlix,
            style: TextStyle(
              color: LoginColors.colorRed,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AppImages.appBarImage),
          ),
        ],
      ),
    );
  }
}
