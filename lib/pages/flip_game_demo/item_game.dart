import 'package:flutter/material.dart';

import 'commons.dart';

class ItemGame extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool visible, isOpen;

  final double width;
  final double height;

  const ItemGame({
    super.key,
    required this.onTap,
    required this.visible,
    required this.isOpen,
    required this.text,
    required this.width,
    required this.height,
  });

  @override
  ItemGameState createState() => ItemGameState();
}

class ItemGameState extends State<ItemGame> {
  double _getWidth() {
    const double dentaw = 240;
    const double dentah = 60;
    double w, h, real;
    w = widget.width;
    h = widget.height;
    if (h < w) {
      if (w - h >= dentaw) {
        real = widget.height / gamePlayHeight;
      } else {
        real = (widget.height - (dentaw - w + h)) / gamePlayHeight;
      }
    } else {
      if (h - w >= dentah) {
        real = widget.width / gamePlayWidth;
      } else {
        real = (widget.width - (dentah - h + w)) / gamePlayWidth;
      }
    }
    return real;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getWidth(),
      height: _getWidth(),
      child: Visibility(
        visible: widget.visible,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            width: _getWidth(),
            height: _getWidth(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              border: Border.all(color: Colors.white, width: 1),
              color: widget.isOpen ? Colors.amberAccent : Colors.greenAccent,
            ),
            child: Center(
              child: Text(
                widget.isOpen ? widget.text : "✤",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.isOpen ? Colors.brown : Colors.blue,
                  fontSize: (200 / gamePlayHeight),
                  fontFamily: "NotoColorEmoji",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
