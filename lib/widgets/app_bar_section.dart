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
            'Cineflix',
            style: TextStyle(
              color: Color.fromARGB(255, 231, 35, 21),
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/profile-icon.jpg"),
          ),
        ],
      ),
    );
  }
}
