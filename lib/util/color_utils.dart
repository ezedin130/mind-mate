import 'package:flutter/material.dart';

Color getMoodColor(String mood) {
  switch (mood.toLowerCase()) {
    case 'great':
      return Colors.green;
    case 'good':
      return Colors.lightGreen;
    case 'okay':
      return Colors.orange;
    case 'sad':
      return Colors.blue;
    case 'stressed':
      return Colors.red;
    default:
      return Colors.grey;
  }
}
