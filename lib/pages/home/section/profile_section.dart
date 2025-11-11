import 'package:flutter/material.dart';

import '../../../util/custom_info_tile.dart';
import '../../../util/reusable_profile_option.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomInfoTile(icon: Icons.mood, label: 'Mood Entries', value: '24', color: Colors.lightBlueAccent),
                  CustomInfoTile(icon: Icons.chat_bubble_outline, label: 'AI Chats', value: '132', color: Colors.teal),
                  CustomInfoTile(icon: Icons.local_fire_department, label: 'Streak', value: '7 Days', color: Colors.red),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  ReUsableProfileOption(icon: Icons.edit, title: 'Edit Profile', onTap: () {}),
                  ReUsableProfileOption(icon: Icons.settings, title: 'Settings', onTap: () {}),
                  ReUsableProfileOption(icon: Icons.lock, title: 'Change Password', onTap: () {}),
                  ReUsableProfileOption(icon: Icons.help, title: 'Help & Support', onTap: () {}),
                  ReUsableProfileOption(icon: Icons.logout, title: 'Log Out', onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
