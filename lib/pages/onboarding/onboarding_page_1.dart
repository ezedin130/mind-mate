import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/pages/onboarding/onboarding_page_2.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF088F8F),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'MindMate',
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mental Health Companion',
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:  (context) => const OnboardingPage2()));
            },
            child: Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: Text('Get Started', style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                color: Color(0XFF088F8F),
                fontSize: 18,
              ),)),
            ),
          ),
        ],
      ),
    );
  }
}
