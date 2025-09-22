import 'package:hive/hive.dart';
import 'package:cineflix_app/models/user_model.dart';
import 'package:cineflix_app/services/shared_prefs.dart';

class UserService {
  static Box<UserModel> getUserBox() => Hive.box<UserModel>('users');

  static Future<bool> saveUser(UserModel user) async {
    final box = getUserBox();
    final exists = box.values.any((u) => u.email == user.email);
    if (exists) return false;

    await box.add(user);
    return true;
  }

  static Future<UserModel?> validateUser(String email, String password) async {
    final box = getUserBox();
    try {
      return box.values.firstWhere(
        (u) => u.email == email && u.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<UserModel?> getCurrentUser() async {
    final email = await SharedPrefs.getUsername();
    if (email == null) return null;

    try {
      return getUserBox().values.firstWhere((u) => u.email == email);
    } catch (e) {
      return null;
    }
  }

  static Future<void> updateUser(
    UserModel user, {
    String? fullName,
    String? password,
    String? profilePic,
  }) async {
    if (fullName != null) user.fullName = fullName;
    if (password != null) user.password = password;
    if (profilePic != null) user.profilePic = profilePic;
    await user.save();
  }

  static Future<void> deleteUser(UserModel user) async {
    await user.delete();
  }
}
