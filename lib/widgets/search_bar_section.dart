import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:flutter/material.dart';

class SearchBarSection extends StatelessWidget {
  final ValueChanged<String>? onSearch;

  const SearchBarSection({super.key, this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
      child: TextField(
        onChanged: onSearch ?? (_) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorsConstants.ColorBlack,
          hintText: 'Search movies, series...',
          hintStyle: TextStyle(color: Colors.white54),
          prefixIcon: Icon(
            Icons.youtube_searched_for_rounded,
            color: LoginColors.redAccent,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: ColorsConstants.ColorWhite),
          ),
        ),
        style: TextStyle(color: ColorsConstants.ColorWhite),
      ),
    );
  }
}
