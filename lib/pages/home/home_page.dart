import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/pages/home/section/home_section.dart';
import 'package:mindmate/pages/home/section/main_grid_section.dart';
import 'package:mindmate/pages/home/section/profile_section.dart';
import 'package:mindmate/util/custom_card_builder.dart';
import 'package:mindmate/util/custom_circle_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onNavBarPresses(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _screens = <Widget>[
    HomeSection(),
    MainGridSection(),
    ProfileSection()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4957),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 40,
              right: -30,
              child: CustomCircleBuilder(size: 100),
            ),
            Positioned(
              top: 160,
              left: -40,
              child: CustomCircleBuilder(size: 80),
            ),
            Positioned(
              bottom: 100,
              right: -40,
              child: CustomCircleBuilder(size: 60),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // Image.asset(
                          //   'assets/mindmate_logo.png', // <-- replace with your logo asset
                          //   height: 40,
                          // ),
                          //const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MIND MATE',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'MENTAL HEALTH COMPANION',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 40, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Wade Warren',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '"Your mind matters." 😊🥰',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                _screens.elementAt(_selectedIndex),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1E4957),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ''),
        ],
        currentIndex: _selectedIndex,
        onTap: _onNavBarPresses,

      ),
    );
  }
 }

