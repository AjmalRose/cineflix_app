import 'package:flutter/material.dart';
import 'package:cineflix_app/widgets/movie_section.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trendingMovies = [
      {
        'image':
            'assets/images/avengers-endgame-2019-directed-by-anthony-and-joe-russo-starring-bradley-cooper-brie-larson-and-chris-hemsworth-epic-conclusion-and-22nd-film-in-the-marvel-cinematic-universe-T33DPT.jpg',
        'title': 'Avengers: Endgame',
        'year': '2019',
        'genre': 'Action',
        'rating': 8.4,
        'description':
            "Avengers: Endgame is the culmination of 22 films in the Marvel Cinematic Universe (MCU), following the devastating events of Avengers: Infinity War where Thanos erased half of all life in the universe.",
      },
      {
        'image':
            'assets/images/MV5BMDAyY2FhYjctNDc5OS00MDNlLThiMGUtY2UxYWVkNGY2ZjljXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
        'title': 'The Shawshank Redemption',
        'year': '1994',
        'genre': 'Drama',
        'rating': 9.3,
        'description':
            "The Shawshank Redemption is a 1994 American prison drama film about Andy Dufresne (Tim Robbins), a banker wrongly convicted of murdering his wife, who finds hope and forms a lasting friendship with Ellis  Redding (Morgan Freeman) during his life sentence at the harsh Shawshank State Penitentiary.",
      },
      {
        'image':
            'assets/images/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX1000_.jpg',
        'title': 'Inception',
        'year': '2010',
        'genre': 'Thriller',
        'rating': 8.8,
        'description':
            "a 2010 science fiction action heist film written and directed by Christopher Nolan, starring Leonardo DiCaprio as a corporate thief who steals information by entering people's dreams.",
      },
      {
        'image': 'assets/images/713o2iu99hL._UF894,1000_QL80_.jpg',
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
