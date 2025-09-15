import 'package:carousel_slider/carousel_slider.dart';
import 'package:cineflix_app/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'carousel_image.dart';

class FeaturedMovieSection extends StatelessWidget {
  FeaturedMovieSection({super.key});

  final List<Map<String, String>> featuredMovies = [
    {
      'image': AppImages.f1Poster,
      'title': 'F1',
      'description':
          'The Movie ... A Formula One driver comes out of retirement to mentor and team with a younger driver.',
    },
    {
      'image': AppImages.lokahPoster,
      'title': 'Lokah',
      'description':
          'Lokah Chapter One: Chandra feels like a strong step towards showing how the..',
    },
    {
      'image': AppImages.cooliePoster,
      'title': 'Coolie',
      'description':
          'The film Coolie (2025) follows Deva (Rajinikanth), a man with a dark past, who seeks vengeance after his friend,',
    },
    {
      'image': AppImages.demonSlayerPoster,
      'title': 'Demon Slayer: Kimetsu no Yaiba  Infinity Castle',
      'description':
          'The Demon Slayer Corps are drawn into the Infinity Castle, where Tanjiro, Nezuko, and the Hashira face terrifying Upper Rank demons in a desperate fight.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: CarouselSlider.builder(
        itemCount: featuredMovies.length,
        options: CarouselOptions(
          height: 210,
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.85,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),
        itemBuilder: (context, index, realIndex) {
          final movie = featuredMovies[index];
          return CarouselImage(
            imagePath: movie['image']!,
            title: movie['title']!,
            description: movie['description']!,
          );
        },
      ),
    );
  }
}
