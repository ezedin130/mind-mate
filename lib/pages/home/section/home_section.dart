import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/pages/activity/suggested_activity_page.dart';
import 'package:mindmate/pages/chatbot/chat_bot_page.dart';
import 'package:mindmate/pages/resource/suggested_resource_page.dart';
import 'package:mindmate/util/custom_text_field.dart';
import '../../../util/reusable_container.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(hint: "search...", obscure: false,color: Colors.lightBlueAccent,),
              const SizedBox(height: 20.0,),
              Text(
                "Your daily companion 💙",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // --- Suggested Exercise Card ---
              ReUsableContainer(context: context, icon: Icons.self_improvement, title: "Suggested Exercise", subtitle: "Try a mindful breathing exercise", color: Colors.blueAccent, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuggestedActivityPage(),
                    ),
                  );
                }),
              const SizedBox(height: 15),

              // --- Suggested Resource Card ---
              ReUsableContainer(context: context, icon: Icons.menu_book_rounded, title: "Suggested Resource", subtitle: "Read something inspiring today", color: Colors.teal, onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuggestedResourcePage(),
                    ),
                  );
                }),

              const SizedBox(height: 15),

              // --- Optional extra suggestion ---
              ReUsableContainer(
                  context: context,
                  icon: Icons.psychology_alt_outlined,
                  title: "AI Reflection",
                  subtitle: "Chat with your AI to reflect on your day",
                  color: Colors.purpleAccent,
                  onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatBotPage(),
                    ),
                  );
                }),
            ],
          ),
        )
      ),
    );
  }
}


