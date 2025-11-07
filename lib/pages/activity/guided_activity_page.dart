import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuidedActivityPage extends StatelessWidget {
  const GuidedActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4957),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4957),
      ),
      body: Center(
        child: Text(
          'Guided Activity',
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
