import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInfoTile extends StatelessWidget {
  const CustomInfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String? label;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 5),
        Text(
          value,
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label!,
          style: GoogleFonts.lato(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }
}