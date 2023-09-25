import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'admin_home.dart';
import 'admin_register.dart';
import 'admin_settings.dart';
import 'admin_tracking_page.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int _selectedIndex = 0;
  final List<Widget Function()> _pages = [
        () => AdminHomePage(),
        () => AdminTracking(),
        ()=> AdminRegister(),
        ()=> AdminSettings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex](),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(233, 237, 201, 1.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex =index;
              });
            },
            curve: Curves.easeInCubic,
            backgroundColor: Color.fromRGBO(233, 237, 201, 1.0),
            color: Color.fromRGBO(212, 163, 115, 1.0),
            activeColor: Color.fromRGBO(212, 163, 115, 1.0),
            tabBackgroundColor: Color.fromRGBO(250, 237, 205, 1.0),
            padding: const EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.pin_drop,
                text: 'Current Transfers',
              ),
              GButton(icon: Icons.settings, text: 'Settings'),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
