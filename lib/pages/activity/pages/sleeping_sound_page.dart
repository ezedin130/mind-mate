import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleepingSoundPage extends StatelessWidget {
  const SleepingSoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4957),
      ),
      backgroundColor: const Color(0xFF1E4957),
      body:  Center(
        child: Text(
          'Sleeping Sounds',
          style: GoogleFonts.lato(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );;
  }
}
