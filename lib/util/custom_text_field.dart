import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.obscure,
    required this.color,
    this.controller
  });

  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        hintText: hint,
        hintStyle: GoogleFonts.lato(color: Colors.grey[600]),
        contentPadding: const EdgeInsets.only(right: 48, left: 16, top: 12, bottom: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}