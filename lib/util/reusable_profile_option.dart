import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReUsableProfileOption extends StatelessWidget {
  const ReUsableProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        title,
        style: GoogleFonts.lato(fontSize: 16, color: Colors.black87),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}