import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/widgets/new_Release_section.dart';
import 'package:cineflix_app/widgets/trending_Section.dart';
import 'package:flutter/material.dart';
import 'package:cineflix_app/widgets/app_bar_section.dart';
import 'package:cineflix_app/widgets/search_bar_section.dart';
import 'package:cineflix_app/widgets/featured_movie_section.dart';
import 'package:cineflix_app/widgets/category_section.dart';

class CineflixHomePage extends StatelessWidget {
  const CineflixHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarSection(),
              FeaturedMovieSection(),
              CategorySection(),
              TrendingSection(),
              NewReleaseSection(),
            ],
          ),
        ),
      ),
    );
  }
}
