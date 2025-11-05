import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindmate/util/custom_text_field.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(hint: "search...", obscure: false,color: Colors.lightBlueAccent,),
              const SizedBox(height: 10.0,),
              ReUsableContainer(
                image: 'lib/assets/exercise.png',
                title: 'Suggested Exercise',
              ),
              const SizedBox(height: 10.0,),
              ReUsableContainer(
                image: 'lib/assets/resource.png',
                title: 'Suggested resource',
              ),
              // const SizedBox(height: 10.0,),
              // Container(
              //   height: 300,
              //   width: 300,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFF1E4957),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              // ),
            ],
          ),
        )
      ),
    );
  }
}

class ReUsableContainer extends StatelessWidget {
  const ReUsableContainer({
    super.key,
    required this.image,
    required this.title
  });
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}