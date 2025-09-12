import 'package:flutter/material.dart';
import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/widgets/movie_Card.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> movies;

  const MovieSection({Key? key, required this.title, required this.movies})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: TextStyle(
              color: ColorsConstants.ColorWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: movies.length,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(
                image: movie['image'] as String,
                title: movie['title'] as String,
                year: movie['year'] as String,
                genre: movie['genre'] as String,
                rating: movie['rating'] as double,
                description: movie['description'] as String?,
              );
            },
          ),
        ),
      ],
    );
  }
}
