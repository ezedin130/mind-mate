import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/reusable_container.dart';

class GuidedActivityPage extends StatelessWidget {
  const GuidedActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4957),
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Column(
          children: [
            Text(
              'Resources',
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5.0,),
            Text(
              'Tools to support your wellbeing',
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ReUsableContainer(
                context: context,
                icon: Icons.air_outlined,
                title: "Breathing Exercise",
                subtitle: "calm your mind with guided breathing",
                color: Colors.blueAccent, onTap: () {}
            ),
            const SizedBox(height: 10.0,),
            ReUsableContainer(
                context: context,
                icon: Icons.self_improvement,
                title: "Meditation",
                subtitle: "find peace in the present moment",
                color: Colors.blueAccent, onTap: () {}
            ),
            const SizedBox(height: 10.0,),
            ReUsableContainer(
                context: context,
                icon: Icons.headset,
                title: "Sleep Sounds",
                subtitle: "relaxing sounds for better sleep",
                color: Colors.blueAccent, onTap: () {}
            ),
            const SizedBox(height: 20.0,),
            Center(
              child: Container(
                width: 400,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFA726), Color(0xFFEC407A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Daily Tip",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      '"Take three deep breaths before responding to stress. '
                          'This simple pause can help you respond thoughtfully '
                          'rather than react emotionally."',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
