import 'package:asa_optichub_worker/screens/worker_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _selectedIndex = 0;
  final List<Widget Function()> _pages = [
        ()=> WorkerHomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(108, 117, 125, 1.0),
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 6,
        title: Text(
          'Optic Hub DashBoard',
          style: GoogleFonts.oxygen(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: _pages[_selectedIndex](),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(108, 117, 125, 1.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            selectedIndex: _selectedIndex,
            onTabChange: (index){
              setState(() {
                _selectedIndex =index;
              });
            },
            curve: Curves.easeInCubic,
            backgroundColor: const Color.fromRGBO(108, 117, 125, 1.0),
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
            tabs: const [
              GButton(
                icon: Icons.home, text: 'Home',),
              GButton(
                icon: Icons.pin_drop,
                text: 'Current Transfers',),
              GButton(
                  icon: Icons.settings,
                  text: 'Settings'),
              GButton(
                icon: Icons.person,
                text: 'Profile',),
            ],
          ),
        ),
      ),
    );
  }
}
