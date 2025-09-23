import 'package:shared_preferences/shared_preferences.dart';
import 'package:cineflix_app/services/shared_prefs.dart';

class FavouriteService {
  static String _keyForUser(String username) => 'favourite_movies_$username';

  static Future<List<String>> getFavourites(String username) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyForUser(username)) ?? [];
  }

  static Future<void> addFavourite(String username, String movieData) async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList(_keyForUser(username)) ?? [];
    if (!favs.contains(movieData)) {
      favs.add(movieData);
      await prefs.setStringList(_keyForUser(username), favs);
    }
  }

  static Future<void> removeFavourite(String username, String movieData) async {
    final prefs = await SharedPreferences.getInstance();
    final favs = prefs.getStringList(_keyForUser(username)) ?? [];
    favs.remove(movieData);
    await prefs.setStringList(_keyForUser(username), favs);
  }

  static Future<void> clearFavourites([String? username]) async {
    final prefs = await SharedPreferences.getInstance();
    final user = username ?? await SharedPrefs.getUsername();
    if (user == null) return;
    await prefs.remove(_keyForUser(user));
  }
}
