import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/pages/tracker/mood_tracker_page.dart';

class MoodResultPage extends StatelessWidget {
  final String mood;
  final String suggestion;
  const MoodResultPage({super.key, required this.mood, required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E4957),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MoodTrackerPage()),
            );
          },
        ),
      ),

      backgroundColor: const Color(0xFF1E4957),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Mood: $mood",
                style: GoogleFonts.lato(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                suggestion,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context)=> MoodTrackerPage())),
                child: const Text("Go Back"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
