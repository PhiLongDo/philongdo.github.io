import 'package:flutter/material.dart';

class StoreButton extends StatelessWidget {
  const StoreButton({
    super.key,
    required this.storeName,
    required this.smallText,
    this.icon,
    this.onTap,
  });

  final String smallText;
  final String storeName;
  final Widget? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              if (icon != null) icon!,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    smallText,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
                  Text(
                    storeName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
