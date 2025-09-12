import 'package:flutter/material.dart';
import 'package:cineflix_app/widgets/movie_section.dart';

class NewReleaseSection extends StatelessWidget {
  const NewReleaseSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newMovies = [
      {
        'image': 'assets/images/images.jpeg',
        'title': 'Indiana Jones',
        'year': '2023',
        'genre': 'Adventure',
        'rating': 7.2,
        'description':
            "a series of films centered on the adventures of fictional archaeologist and adventurer Dr. Indiana Jones, who races against villains to find and secure powerful, legendary artifacts to prevent them from falling into the wrong hands.",
      },
      {
        'image': 'assets/images/images (1).jpeg',
        'title': 'The Notebook 2',
        'year': '2004',
        'genre': 'Romance',
        'rating': 7.8,
        'description':
            " While the story of Noah and Allie concluded in the first film, fans and social media pages sometimes create hypothetical plot descriptions, such as one involving a rediscovered journal or a continuation of their story with their children's lives. The only continuation of the story is the 2003 novel The Wedding, which is a sequel to the book but has not been adapted into a movie, and remains a fictional possibility for a film. ",
      },
      {
        'image': 'assets/images/81y0foYjoFL._UF1000,1000_QL80_.jpg',
        'title': 'Spider-Man: No Way Home',
        'year': '2021',
        'genre': 'Action',
        'rating': 8.3,
        'description':
            "Thrilled by his experience with the Avengers, young Peter Parker returns home to live with his Aunt May. Under the watchful eye of mentor Tony Stark, Parker starts to embrace his newfound identity as Spider-Man.",
      },
      {
        'image': 'assets/images/Dune_(2021_film).jpg',
        'title': 'Dune',
        'year': '2021',
        'genre': 'Sci-Fi',
        'rating': 8.1,
        'description':
            "an epic sci-fi film adaptation of Frank Herbert's classic novel, following Paul Atreides as his family is tasked with governing the dangerous desert planet Arrakis",
      },
    ];

    return MovieSection(title: "🆕 New Releases", movies: newMovies);
  }
}
