import 'package:flutter/material.dart';

class WatchlistMovieCard extends StatelessWidget {
  final String title;
  final String date;
  final String genre;
  final String image;

  const WatchlistMovieCard({
    super.key,
    required this.title,
    required this.date,
    required this.genre,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(image, width: 60, height: 80, fit: BoxFit.cover),
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(date, style: TextStyle(color: Colors.grey)),
        trailing: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(genre, style: TextStyle(color: Colors.red)),
        ),
      ),
    );
  }
}
