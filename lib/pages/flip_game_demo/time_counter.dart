import 'package:flutter/material.dart';

class TimeCounter extends StatelessWidget {
  const TimeCounter({super.key, required this.ticks});
  final int ticks;

  /// Format MMSS
  String formatMMSS() {
    String str = '';
    int minutes = ticks ~/ 60;
    str = ('0$minutes').substring(minutes.toString().length - 1);
    int seconds = ticks % 60;
    str = "$str:${("0$seconds").substring(seconds.toString().length - 1)}";
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            formatMMSS(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
