import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestedResourcePage extends StatelessWidget {
  const SuggestedResourcePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4957),
      ),
      backgroundColor: const Color(0xFF1E4957),
      body:  Center(
        child: Text(
          'Suggested Resource',
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
