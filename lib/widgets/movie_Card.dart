import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final String title;
  final String year;
  final String genre;
  final double rating;
  final String? description; // optional
  final String duration; // new - optional on card, default provided
  final bool isFeatured;

  MovieCard({
    Key? key,
    required this.image,
    required this.title,
    required this.year,
    required this.genre,
    required this.rating,
    this.description,
    this.duration = 'N/A', // default so existing usages won't break
    this.isFeatured = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate to detail screen and pass duration
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailScreen(
              image: image,
              title: title,
              year: year,
              genre: genre,
              rating: rating,
              description: description ?? 'No description available.',
              duration: duration,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    height: 200,
                    width: 140,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => Container(
                      height: 200,
                      width: 140,
                      color: Colors.grey[900],
                      child: Center(
                        child: Icon(Icons.broken_image, color: Colors.white30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: ColorsConstants.ColorBlack.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 14),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: ColorsConstants.ColorWhite,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                color: ColorsConstants.ColorWhite,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              year,
              style: TextStyle(color: LoginColors.colorgrey, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              genre,
              style: TextStyle(color: LoginColors.colorgrey, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
