import 'package:cineflix_app/screens/splashScreen.dart';
import 'package:cineflix_app/widgets/category_section.dart';
import 'package:cineflix_app/widgets/movie_Card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class TextConstants {
  final splashwelcome = "Welcome to CineFlix";
  static final appBarName = "CineFlix";
}

class LoginText {
  final cineFlix = "cineflix";
  static final secondText = "Stream • Discover • Enjoy";
  static final createAccount = "Create Account";
  static final fourthText = "Join millions of movie lovers";
  static final orContinueWith = "Or continue with";
  static final textSpan = "Already have an account?";
  static final textSpan2 = "Sign In";

  static const String fullName = "Full Name";
  static const String email = "Email";
  static const String password = "Password";
  static const String confirmPassword = "Confirm Password";
}

class AppFonts {
  static const double heading = 32;
  static const FontWeight bold = FontWeight.bold;
  static const double createAccount = 22;

  // AppBarSection
  static final TextStyle appbarFont = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  //  SearchbarList
  static final TextStyle noMoviesFound = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // carouselSlider
  static final TextStyle carouselSliderfont = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle carouselSliderfont1 = TextStyle(fontSize: 14);

  // CategorySection
  static final TextStyle categoriesTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // MovieSection
  static final TextStyle titles = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // MovieCard
  static final TextStyle rating = TextStyle(fontSize: 12);
  static final TextStyle title = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle year = TextStyle(fontSize: 12);
  static final TextStyle genre = TextStyle(fontSize: 12);

  // logoutProfile
  static final TextStyle logout = TextStyle(fontSize: 18);
}
