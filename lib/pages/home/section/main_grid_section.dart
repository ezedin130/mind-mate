import 'package:flutter/material.dart';
import 'package:mindmate/pages/activity/guided_activity_page.dart';
import 'package:mindmate/pages/chatbot/chat_bot_page.dart';
import 'package:mindmate/pages/resource/resource_page.dart';
import 'package:mindmate/pages/tracker/mood_tracker_page.dart';
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
          children: [
            CustomCardBuilder(
              title: 'Resource',
              color: Color(0xFF4EB3E8),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResourcePage(),
                    ),
                );
              },
            ),
            CustomCardBuilder(
              title: 'Chatbot',
              color: Color(0xFF4B7E6E),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=> ChatBotPage(),
                ),
                );
              }
            ),
            CustomCardBuilder(
              title: 'Guided Activity',
              color: Color(0xFF556C79),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GuidedActivityPage(),
                    ),
                );
              },
            ),
            CustomCardBuilder(
              title: 'Mood Tracker',
              color: Color(0xFF6C627D),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=> MoodTrackerPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}