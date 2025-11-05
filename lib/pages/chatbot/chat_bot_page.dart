import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'ChatBot',
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
