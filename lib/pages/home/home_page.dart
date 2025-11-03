import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/util/custom_card_builder.dart';
import 'package:mindmate/util/custom_circle_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 30,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: [
                        CustomCardBuilder(
                          title: 'Resource',
                          color: const Color(0xFF4EB3E8),
                        ),
                        CustomCardBuilder(
                          title: 'Chatbot',
                          color: const Color(0xFF4B7E6E),
                        ),
                        CustomCardBuilder(
                          title: 'Guided Activity',
                          color: const Color(0xFF556C79),
                        ),
                        CustomCardBuilder(
                          title: 'Mood Tracker',
                          color: const Color(0xFF6C627D),
                        ),
                      ],
                    ),
                  ),
                ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.grid_view_rounded),
          //   label: '',
          // ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
