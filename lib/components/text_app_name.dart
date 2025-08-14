import 'package:flutter/material.dart';

class TextAppName extends StatelessWidget {
  const TextAppName({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        color: Colors.blueAccent,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
