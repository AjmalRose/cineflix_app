import 'package:flutter/material.dart';
import 'package:cineflix_app/models/user_model.dart';
import 'package:cineflix_app/services/user_service.dart';

class EditProfileScreen extends StatefulWidget {
  final UserModel? user;
  const EditProfileScreen({super.key, this.user});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameCtrl.text = widget.user?.fullName ?? '';
    emailCtrl.text = widget.user?.email ?? '';
    passCtrl.text = widget.user?.password ?? '';
  }

  Future<void> _saveProfile() async {
    final updatedUser = UserModel(
      fullName: nameCtrl.text,
      email: emailCtrl.text,
      password: passCtrl.text,
    );
    await UserService.updateUser(updatedUser);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Edit Profile"), backgroundColor: Colors.red),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passCtrl,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveProfile, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
