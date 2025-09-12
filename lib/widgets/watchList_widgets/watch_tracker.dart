import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WatchTracker {
  static const _key = 'genreCounts';

  // Get current genre counts
  static Future<Map<String, int>> getGenreCounts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data == null) return {};
    return Map<String, int>.from(jsonDecode(data));
  }

  // Increment genre count
  static Future<void> addGenre(String genre) async {
    final prefs = await SharedPreferences.getInstance();
    final counts = await getGenreCounts();
    counts[genre] = (counts[genre] ?? 0) + 1;
    await prefs.setString(_key, jsonEncode(counts));
  }

  // Clear stats
  static Future<void> clearStats() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
