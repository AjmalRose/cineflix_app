import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String keyIsLoggedIn = "isLoggedIn";

  // Save login state
  static Future<void> setLoginStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsLoggedIn, status);
  }

  // Get login state
  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsLoggedIn) ?? false;
  }

  // Clear login (for logout)
  static Future<void> clearLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyIsLoggedIn);
  }
}
