import 'package:flutter/material.dart';

class SearchList extends StatelessWidget {
  final List<Map<String, String>> movies;
  final String query;

  const SearchList({super.key, required this.movies, required this.query});

  @override
  Widget build(BuildContext context) {
    final filteredMovies = movies.where((movie) {
      final title = movie['title']!.toLowerCase();
      final search = query.toLowerCase();
      return title.contains(search);
    }).toList();

    final displayList = query.isEmpty ? movies : filteredMovies;

    if (displayList.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "No movies found for \"$query\"",
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      itemCount: displayList.length,
      separatorBuilder: (_, __) => const Divider(color: Colors.white24),
      itemBuilder: (context, index) {
        final movie = displayList[index];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              movie['image']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            movie['title']!,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            movie['description']!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        );
      },
    );
  }
}
