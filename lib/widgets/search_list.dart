import 'package:cineflix_app/widgets/movie_Card.dart';
import 'package:flutter/material.dart';

class SearchList extends StatelessWidget {
  final List<Map<String, dynamic>> movies;
  final String query;

  const SearchList({Key? key, required this.movies, required this.query})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 🔍 Filter movies based on query
    final filteredMovies = movies.where((movie) {
      final title = movie['title'].toString().toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    if (query.isEmpty) {
      return const Center(
        child: Text(
          "Search for your favorite movies 🎬",
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    if (filteredMovies.isEmpty) {
      return const Center(
        child: Text(
          "No movies found 😢",
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.65,
      ),
      itemCount: filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = filteredMovies[index];
        return MovieCard(
          image: movie['image'],
          title: movie['title'],
          year: movie['year'],
          genre: movie['genre'],
          rating: movie['rating'],
        );
      },
    );
  }
}
