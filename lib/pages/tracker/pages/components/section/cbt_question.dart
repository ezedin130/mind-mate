import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../mood/mood_questionnaire_page.dart';

class CbtQuestion extends StatefulWidget {
  const CbtQuestion({super.key});

  @override
  State<CbtQuestion> createState() => _CbtQuestionState();
}

class _CbtQuestionState extends State<CbtQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CBT Questions",
                style: GoogleFonts.lato(
                  fontSize: 34,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                "Challenge automatic thoughts and reframe your perspective with evidence-based techniques.",
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: const Color.fromARGB(221, 255, 255, 255),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.psychology,
                        size: 26,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 1, 45, 205),
                        elevation: 5,
                        minimumSize: const Size(double.infinity, 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Colors.white24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MoodQuestionnairePage(),
                          ),
                        );
                      },
                      label: Text(
                        "Start CBT Questions",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
