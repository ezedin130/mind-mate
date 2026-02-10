import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/pages/tracker/pages/components/section/header.dart';
import 'package:mindmate/pages/tracker/pages/components/section/main_content.dart';
import 'package:mindmate/service/mood_service.dart';

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({super.key});

  @override
  State<MoodTrackerPage> createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 102, 6),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 228, 102, 6),
        title: Column(
          children: [
            Text(
              'Mood Tracker',
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              'Track your emotional wellbeing',
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildNavigationTabs(),
          const SizedBox(height: 10.0),
          Expanded(child: MainContent(selectedIndex: _selectedIndex)),
        ],
      ),
    );
  }

  //app bar
  //nav
  Widget _buildNavigationTabs() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 239, 149, 53),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildNavItem("Quick Mood", 0),
            _buildNavItem("CBT Question", 2),
          ],
        ),
      ),
    );
  }

  //nav
  Widget _buildNavItem(String title, int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: Container(
        width: isSelected ? 2 : 1,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(255, 18, 3, 221)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border(
            bottom: BorderSide(color: Colors.white.withOpacity(0.3), width: 1),
          ),
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
          child: Text(
            title,
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
