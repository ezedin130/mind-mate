import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoodHistoryPage extends StatelessWidget {
  const MoodHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4957),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4957),
      ),
      body: Center(
        child: Text(
          "Mood History",
          style: GoogleFonts.lato(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
