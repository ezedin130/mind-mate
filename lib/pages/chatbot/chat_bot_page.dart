import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/util/custom_text_field.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFF1E4957),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4957),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Center(
            child: Text(
              'How can I help?',
              style: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
          ),
          const SizedBox(height: 20.0,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomTextField(
              hint: "Ask Anything",
              obscure: false,
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
