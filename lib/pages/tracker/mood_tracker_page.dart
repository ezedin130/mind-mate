import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodTrackerPage extends StatelessWidget {
  const MoodTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Mood Tracker',
          style: GoogleFonts.lato(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        ),
      ),
    );
  }
}
