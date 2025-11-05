import 'package:flutter/material.dart';
import '../../../util/custom_card_builder.dart';

class MainGridSection extends StatelessWidget {
  const MainGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 30,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: const [
            CustomCardBuilder(
              title: 'Resource',
              color: Color(0xFF4EB3E8),
            ),
            CustomCardBuilder(
              title: 'Chatbot',
              color: Color(0xFF4B7E6E),
            ),
            CustomCardBuilder(
              title: 'Guided Activity',
              color: Color(0xFF556C79),
            ),
            CustomCardBuilder(
              title: 'Mood Tracker',
              color: Color(0xFF6C627D),
            ),
          ],
        ),
      ),
    );
  }
}