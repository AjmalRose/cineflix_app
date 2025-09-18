import 'package:shared_preferences/shared_preferences.dart';

class FavouriteService {
  static const _key = 'favourite_movies';

  static Future<List<String>> getFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  static Future<void> addFavourite(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList(_key) ?? [];
    if (!favs.contains(title)) {
      favs.add(title);
      await prefs.setStringList(_key, favs);
    }
  }

  static Future<void> removeFavourite(String title) async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList(_key) ?? [];
    favs.remove(title);
    await prefs.setStringList(_key, favs);
  }
}
