import 'package:cineflix_app/widgets/movie_Card.dart';
import 'package:flutter/material.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movies = [
      {
        'image':
            'assets/images/avengers-endgame-2019-directed-by-anthony-and-joe-russo-starring-bradley-cooper-brie-larson-and-chris-hemsworth-epic-conclusion-and-22nd-film-in-the-marvel-cinematic-universe-T33DPT.jpg',
        'title': 'Avengers: Endgame',
        'year': '2019',
        'genre': 'Action',
        'rating': 8.4,
      },
      {
        'image':
            'assets/images/MV5BMDAyY2FhYjctNDc5OS00MDNlLThiMGUtY2UxYWVkNGY2ZjljXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
        'title': 'The Shawshank Redemption',
        'year': '1994',
        'genre': 'Drama',
        'rating': 9.3,
      },
      {
        'image':
            'assets/images/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX1000_.jpg',
        'title': 'Inception',
        'year': '2010',
        'genre': 'Thriller',
        'rating': 8.8,
      },
      {
        'image': 'assets/images/713o2iu99hL._UF894,1000_QL80_.jpg',
        'title': 'pulp Fiction',
        'year': '1994',
        'genre': 'Crime',
        'rating': 8.9,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "🎬 Trending Now",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 30),
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
              );
            },
          ),
        ),
      ],
    );
  }
}
