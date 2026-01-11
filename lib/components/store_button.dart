import 'package:flutter/material.dart';

class StoreButton extends StatelessWidget {
  const StoreButton({required this.storeType, this.onTap, super.key});

  final StoreType storeType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            spacing: 4.0,
            children: [
              if (storeType.icon != null)
                Icon(storeType.icon, color: storeType.color, size: 28),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeType.smallText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onInverseSurface,
                    ),
                  ),
                  Text(
                    storeType.storeName,
                    style: TextStyle(
                      fontSize: 16,
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

enum StoreType {
  googlePlay(
    smallText: 'Download for',
    storeName: 'Android',
    icon: IconData(0xe808, fontFamily: 'CustomIcons'),
    color: Colors.green,
  ),
  appleStore(
    smallText: 'Download for',
    storeName: 'iOS',
    icon: Icons.apple,
    color: Colors.white,
  ),
  pubdev(
    smallText: 'Get it on',
    storeName: 'Pub.dev',
    icon: IconData(0xe807, fontFamily: 'CustomIcons'),
    color: Colors.blueAccent,
  ),
  windowsStore(
    smallText: 'Download for',
    storeName: 'Windows',
    icon: Icons.window_sharp,
    color: Colors.lightBlue,
  );

  final String smallText;
  final String storeName;
  final IconData? icon;
  final Color color;

  const StoreType({
    required this.smallText,
    required this.storeName,
    required this.color,
    this.icon,
  });
}
