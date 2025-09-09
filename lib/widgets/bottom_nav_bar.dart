import 'package:cineflix_app/constants/colors_contants.dart';
import 'package:cineflix_app/screens/downloadScreen.dart';
import 'package:cineflix_app/screens/profile_screen.dart';
import 'package:cineflix_app/screens/watchListScreen.dart';
import 'package:flutter/material.dart';
import '../screens/cine_Flix_homePage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CineflixHomePage(),
    WatchlistScreen(),
    DownloadsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorsConstants.ColorBlack,
        selectedItemColor: LoginColors.colorRed,
        unselectedItemColor: LoginColors.colorgrey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
