import 'package:hive/hive.dart';
import '../models/user_model.dart';

class UserService {
  static const String _userBox = 'users';
  static const String _currentUserKey = 'currentUser';

  static Future<Box<UserModel>> _getBox() async {
    return await Hive.openBox<UserModel>(_userBox);
  }

  /// Create User
  static Future<void> saveUser(UserModel user) async {
    final box = await _getBox();
    await box.put(_currentUserKey, user);
  }

  /// Get Current User
  static Future<UserModel?> getUser() async {
    final box = await _getBox();
    return box.get(_currentUserKey);
  }

  /// Update User
  static Future<void> updateUser(UserModel updatedUser) async {
    final box = await _getBox();
    await box.put(_currentUserKey, updatedUser);
  }

  /// Delete User
  static Future<void> deleteUser() async {
    final box = await _getBox();
    await box.delete(_currentUserKey);
  }

  /// Check if user exists
  static Future<bool> isUserLoggedIn() async {
    final box = await _getBox();
    return box.containsKey(_currentUserKey);
  }
}
