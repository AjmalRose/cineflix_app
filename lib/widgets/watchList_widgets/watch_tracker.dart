import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cineflix_app/services/shared_prefs.dart';

class WatchTracker {
  // Generate a unique key per user
  static Future<String?> _getUserKey([String? username]) async {
    final user = username ?? await SharedPrefs.getUsername();
    if (user == null) return null;
    return '${user}_genreCounts';
  }

  // Get current genre counts for a specific or logged-in user
  static Future<Map<String, int>> getGenreCounts({String? username}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = await _getUserKey(username);
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

  // ✅ Clear stats for a specific or logged-in user
  static Future<void> clearStats([String? username]) async {
    final prefs = await SharedPreferences.getInstance();
    final key = await _getUserKey(username);
    if (key != null) {
      await prefs.remove(key);
    }
  }
}
