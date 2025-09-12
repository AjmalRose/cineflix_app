import 'package:flutter/material.dart';

class SearchList extends StatelessWidget {
  final List<Map<String, String>> movies; // Full movie list
  final String query; // The text user typed

  const SearchList({super.key, required this.movies, required this.query});

  @override
  Widget build(BuildContext context) {
    // 🔍 Filter movies based on query
    final filteredMovies = movies.where((movie) {
      final title = movie['title']!.toLowerCase();
      final search = query.toLowerCase();
      return title.contains(search);
    }).toList();

    // If nothing typed, show all movies
    final displayList = query.isEmpty ? movies : filteredMovies;

    return Expanded(
      child: ListView.builder(
        itemCount: displayList.length,
        itemBuilder: (context, index) {
          final movie = displayList[index];
          return ListTile(
            leading: Image.asset(
              movie['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              movie['title']!,
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              movie['description']!,
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
