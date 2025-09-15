import 'package:cineflix_app/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:cineflix_app/widgets/movie_section.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trendingMovies = [
      {
        'image': AppImages.avengersPoster,
        'title': 'Avengers: Endgame',
        'year': '2019',
        'genre': 'Action',
        'rating': 8.4,
        'description':
            "Avengers: Endgame is the culmination of 22 films in the Marvel Cinematic Universe (MCU), following the devastating events of Avengers: Infinity War where Thanos erased half of all life in the universe.",
      },
      {
        'image': AppImages.shawshankPoster,
        'title': 'The Shawshank Redemption',
        'year': '1994',
        'genre': 'Drama',
        'rating': 9.3,
        'description':
            "The Shawshank Redemption is a 1994 American prison drama film about Andy Dufresne (Tim Robbins), a banker wrongly convicted of murdering his wife, who finds hope and forms a lasting friendship with Ellis  Redding (Morgan Freeman) during his life sentence at the harsh Shawshank State Penitentiary.",
      },
      {
        'image': AppImages.inceptionPoster,
        'title': 'Inception',
        'year': '2010',
        'genre': 'Thriller',
        'rating': 8.8,
        'description':
            "a 2010 science fiction action heist film written and directed by Christopher Nolan, starring Leonardo DiCaprio as a corporate thief who steals information by entering people's dreams.",
      },
      {
        'image': AppImages.pulpFictionPoster,
        'title': 'Pulp Fiction',
        'year': '1994',
        'genre': 'Crime',
        'rating': 8.9,
        'description':
            "Pulp Fiction is a 1994 independent crime film by Quentin Tarantino that tells a non-linear, interconnected story of several criminals in Los Angeles. ",
      },
    ];

    return MovieSection(title: "🎬 Trending Now", movies: trendingMovies);
  }
}
