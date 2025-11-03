import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/pages/auth/login_page.dart';
import 'package:mindmate/util/custom_circle_builder.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF088F8F),
      //  const Color(0xFF1E4957),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top: 40, right: -30, child: CustomCircleBuilder(size: 100)),
            Positioned(bottom: 80, left: -20, child: CustomCircleBuilder(size: 70)),
            Positioned(top: 180, left: -5, child: CustomCircleBuilder(size: 50)),
            Positioned(bottom: -20, right: 50, child: CustomCircleBuilder(size: 60)),
            Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Image.asset(
                        //   'assets/mindmate_logo.png',
                        //   height: 80,
                        // ),
                        //const SizedBox(height: 16),
                        Text(
                          'MindMate',
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '"Breath Heal & Grow"',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            'Welcome to your safe space — where every breath brings calm, every step builds strength, and every moment helps you grow.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Bottom button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4EB3E8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

