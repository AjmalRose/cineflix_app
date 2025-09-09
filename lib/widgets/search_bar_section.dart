import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:flutter/material.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[900],
          hintText: 'Search movies, series...',
          hintStyle: TextStyle(color: Colors.white54),
          prefixIcon: Icon(
            Icons.youtube_searched_for_rounded,
            color: Colors.redAccent[700],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        style: TextStyle(color: ColorsConstants.ColorWhite),
      ),
    );
  }
}
