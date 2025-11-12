import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/pages/tracker/pages/components/section/header.dart';
import 'package:mindmate/pages/tracker/pages/components/section/main_content.dart';

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
      backgroundColor: const Color(0xFF1E4957),
      body: SafeArea(
        child: Column(
          children: [
            Header(context: context),
            _buildNavigationTabs(),
            const SizedBox(height: 10.0,),
            Expanded(
              child: MainContent(selectedIndex: _selectedIndex),
            ),
          ],
        ),
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
          color: const Color(0xFF1E4957),
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
            _buildNavItem("CBT Journal", 1),
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
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
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
