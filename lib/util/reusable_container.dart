import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReUsableContainer extends StatelessWidget {
  const ReUsableContainer({
    super.key,
    required this.image,
    required this.title,
    required this.onTap
  });
  final String image;
  final String title;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              alignment: Alignment.center
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
            alignment: Alignment.bottomCenter,
            child:Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )
        ),
      ),
    );
  }
}