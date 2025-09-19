import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cineflix_app/services/shared_prefs.dart';

class WatchTracker {
  // Generate a unique key per user
  static Future<String?> _getUserKey() async {
    final username = await SharedPrefs.getUsername();
    if (username == null) return null;
    return '${username}_genreCounts';
  }

  // Get current genre counts for the logged-in user
  static Future<Map<String, int>> getGenreCounts() async {
    final prefs = await SharedPreferences.getInstance();
    final key = await _getUserKey();
    if (key == null) return {};
    final data = prefs.getString(key);
    if (data == null) return {};
    return Map<String, int>.from(jsonDecode(data));
  }

  // Increment genre count for the current user
  static Future<void> addGenre(String genre) async {
    final prefs = await SharedPreferences.getInstance();
    final key = await _getUserKey();
    if (key == null) return;

    final counts = await getGenreCounts();
    counts[genre] = (counts[genre] ?? 0) + 1;
    await prefs.setString(key, jsonEncode(counts));
  }

  // Clear stats only for the logged-in user
  static Future<void> clearStats() async {
    final prefs = await SharedPreferences.getInstance();
    final key = await _getUserKey();
    if (key != null) {
      await prefs.remove(key);
    }
  }
}
