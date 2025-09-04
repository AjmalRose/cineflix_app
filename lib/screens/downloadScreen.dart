import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Downloads"),
        backgroundColor: Colors.red[700],
      ),
      body: Center(
        child: Text(
          "No Downloads Yet",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
