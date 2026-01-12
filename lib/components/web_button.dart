import 'package:flutter/material.dart';

class WebButton extends StatelessWidget {
  const WebButton({super.key, this.onTap, this.webType = WebType.playOnWeb});

  final VoidCallback? onTap;
  final WebType webType;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            child: Row(
              children: [
                Icon(
                  Icons.language,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                Text(
                  webType.text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum WebType {
  webDemo(text: 'Web demo'),
  playOnWeb(text: 'Play on Web');

  final String text;
  const WebType({required this.text});
}
