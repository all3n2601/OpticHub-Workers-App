// ignore_for_file: prefer_const_constructors

import 'package:asa_optichub_worker/screens/worker_home.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'map_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget Function()> _pages = [
    () => WorkerHomePage(),
    () => MapPage()
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
