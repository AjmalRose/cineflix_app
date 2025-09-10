import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/widgets/app_bar_section.dart';
import 'package:cineflix_app/widgets/category_section.dart';
import 'package:cineflix_app/widgets/featured_movie_section.dart';
import 'package:cineflix_app/widgets/film_search_names.dart';
import 'package:cineflix_app/widgets/new_release_section.dart';
import 'package:cineflix_app/widgets/search_bar_section.dart';
import 'package:cineflix_app/widgets/search_list.dart';
import 'package:cineflix_app/widgets/trending_section.dart';
import 'package:flutter/material.dart';

class CineflixHomePage extends StatefulWidget {
  const CineflixHomePage({super.key});

  @override
  State<CineflixHomePage> createState() => _CineflixHomePageState();
}

class _CineflixHomePageState extends State<CineflixHomePage> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final bool isSearching = searchQuery.isNotEmpty;

    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Top App Bar
            AppBarSection(),

            // 🔍 Search Bar
            SearchBarSection(
              onSearch: (value) {
                setState(() => searchQuery = value.trim());
              },
            ),

            // 🔹 Show Search Results OR Original Layout
            Expanded(
              child: isSearching
                  ? SearchList(
                      movies: FilmSearchNames.movies,
                      query: searchQuery,
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FeaturedMovieSection(),
                          CategorySection(),
                          TrendingSection(),
                          NewReleaseSection(),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
