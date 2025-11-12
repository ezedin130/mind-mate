
import 'package:flutter/material.dart';

import 'cbt_journal.dart';
import 'cbt_question.dart';
import 'quick_mood_content.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (_selectedIndex == 0) const QuickMoodContent(),
            if (_selectedIndex == 1) const CbtJournal(),
            if (_selectedIndex == 2) const CbtQuestion(),
          ],
        ),
      ),
    );
  }
}