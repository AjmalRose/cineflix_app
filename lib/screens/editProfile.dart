// edit_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:cineflix_app/models/user_model.dart';
import 'package:cineflix_app/services/user_service.dart';
import 'package:cineflix_app/widgets/login_widgets.dart';
import 'package:cineflix_app/constants/colors_contants.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel user;
  const EditProfileScreen({super.key, required this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameCtrl;
  late TextEditingController passCtrl;
  late TextEditingController picCtrl;

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController(text: widget.user.fullName);
    passCtrl = TextEditingController(text: widget.user.password);
    picCtrl = TextEditingController(text: widget.user.profilePic ?? "");
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    passCtrl.dispose();
    picCtrl.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    final newName = nameCtrl.text.trim();
    final newPass = passCtrl.text.trim();
    final newPic = picCtrl.text.trim();

    if (newName.isEmpty || newPass.isEmpty) {
      _showError("Full Name and Password cannot be empty");
      return;
    }

    await UserService.updateUser(
      widget.user,
      fullName: newName,
      password: newPass,
      profilePic: newPic,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile updated successfully"),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context); // Go back to previous screen
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: LoginColors.colorRed),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.ColorBlack,
      appBar: AppBar(
        backgroundColor: ColorsConstants.ColorBlack,
        title: const Text("Edit Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            inputField(hint: "Full Name", controller: nameCtrl),
            const SizedBox(height: 15),
            inputField(
              hint: "Password",
              controller: passCtrl,
              isPassword: true,
            ),
            const SizedBox(height: 15),
            inputField(hint: "Profile Pic URL", controller: picCtrl),
            const SizedBox(height: 30),
            mainButton(text: "Save Changes", onPressed: _saveChanges),
          ],
        ),
      ),
    );
  }
}
