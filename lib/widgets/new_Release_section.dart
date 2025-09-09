import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/widgets/movie_Card.dart';
import 'package:flutter/material.dart';

class NewReleaseSection extends StatelessWidget {
  const NewReleaseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        'image': 'assets/images/images.jpeg',
        'title': 'Indiana Jones',
        'year': '2023',
        'genre': 'Adventure',
        'rating': 7.2,
      },
      {
        'image': 'assets/images/images (1).jpeg',
        'title': ' The Notebook 2',
        'year': '2004',
        'genre': 'Romance',
        'rating': 7.8,
      },
      {
        'image': 'assets/images/81y0foYjoFL._UF1000,1000_QL80_.jpg',
        'title': 'Spider-Man: No Way Home',
        'year': '2021',
        'genre': 'Action',
        'rating': 8.3,
      },
      {
        'image': 'assets/images/Dune_(2021_film).jpg',
        'title': 'Dune',
        'year': '2021',
        'genre': 'Sci-Fi',
        'rating': 8.1,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "🆕 New Releases",
            style: TextStyle(
              color: ColorsConstants.ColorWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: movies.length,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final m = movies[index];
              return MovieCard(
                image: m['image'] as String,
                title: m['title'] as String,
                year: m['year'] as String,
                genre: m['genre'] as String,
                rating: m['rating'] as double,
              );
            },
          ),
        ),
      ],
    );
  }
}
