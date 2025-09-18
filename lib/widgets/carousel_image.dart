import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/constants/text_constants.dart';
import 'package:flutter/material.dart';

class CarouselImage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const CarouselImage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  ColorsConstants.ColorBlack.withOpacity(0.7),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.carouselSliderfont.copyWith(
                    color: ColorsConstants.ColorWhite,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: AppFonts.carouselSliderfont1.copyWith(
                    color: LoginColors.colorgrey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 10),
                Icon(
                  Icons.play_circle_fill_rounded,
                  size: 50,
                  color: LoginColors.colorRed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
