import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Action', 'Drama', 'Comedy', 'Thriller', 'Horror'];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: TextStyle(
              color: ColorsConstants.ColorWhite,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (_, __) => SizedBox(width: 10),
              itemBuilder: (context, index) {
                return Chip(
                  label: Text(categories[index]),
                  backgroundColor: LoginColors.colorRed,
                  labelStyle: TextStyle(color: ColorsConstants.ColorWhite),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
