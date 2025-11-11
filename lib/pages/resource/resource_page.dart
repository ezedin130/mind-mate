import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/reusable_container.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({super.key});

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
                icon: Icons.cached,
                title: "Understanding anxiety",
                subtitle: "mental health",
                color: Colors.blueAccent, onTap: () {}
            ),
            const SizedBox(height: 10.0,),
            ReUsableContainer(
                context: context,
                icon: Icons.balance,
                title: "Building healthy habits",
                subtitle: "wellness",
                color: Colors.blueAccent, onTap: () {}
            ),
            const SizedBox(height: 10.0,),
            ReUsableContainer(
                context: context,
                icon: Icons.self_improvement,
                title: "Mindfulness in daily life",
                subtitle: "Mindfulness",
                color: Colors.blueAccent, onTap: () {}
            ),
            const SizedBox(height: 10.0,),
            ReUsableContainer(
                context: context,
                icon: Icons.cloud_queue,
                title: "What really is depression?",
                subtitle: "depression",
                color: Colors.blueAccent, onTap: () {}
            ),
            const SizedBox(height: 10.0,),
            ReUsableContainer(
                context: context,
                icon: Icons.flash_on,
                title: "Understanding stress",
                subtitle: "stress",
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
                        Icons.help,
                        color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Need Immediate Help?",
                      style: GoogleFonts.lato(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  '"If you are in crisis '
                      'Please reach out to '
                      'professional helpline"',
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                    onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,

                  ),
                    child: Text(
                      'View Crisis Resources',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                        )
                    ),
                )
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
