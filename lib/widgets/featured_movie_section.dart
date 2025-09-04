import 'package:flutter/material.dart';

class FeaturedMovieSection extends StatelessWidget {
  const FeaturedMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/F1-Film-Poster-001-750x400.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),

            Positioned(
              bottom: 10,
              right: 350,
              child: Center(
                child: Icon(
                  Icons.play_circle_fill_rounded,
                  size: 55,
                  color: Color.fromARGB(255, 138, 46, 46).withOpacity(0.9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
