import 'package:flutter/material.dart';

class PlayOnWebButton extends StatelessWidget {
  const PlayOnWebButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        margin: EdgeInsets.only(top: 8),
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
          child: Row(
            children: [
              Icon(
                Icons.language,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              Text(
                'Play on Web',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}
