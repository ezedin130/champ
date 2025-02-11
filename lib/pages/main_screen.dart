import 'package:flutter/material.dart';
import 'package:map/pages/screens/filter_page.dart';
import 'package:map/pages/screens/map_page.dart';
import 'package:map/pages/screens/profile_page.dart';

class MainScreen extends StatefulWidget {
  static const id = 'home';

  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _myIndex = 0;
  final List pages = [
    MapPage(),
    const VehiclePage(),
    const ProfilePage()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _myIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            setState(() {
              _myIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/home.png',
                width: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/love.png',
                width: 25,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'lib/assets/user.png',
                width: 25,
              ),
              label: 'Profile',
            ),
          ]),
      body: pages[_myIndex],
    );
  }
}
