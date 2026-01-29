import 'package:flutter/material.dart';

/// A widget that displays an image asset, preferring WebP format if available,
/// and falls back to PNG if not. If both fail or are missing, an icon is shown.
///
/// - [webpAsset]: The path to the WebP asset.
/// - [width]: The width of the image.
/// - [height]: The height of the image.
class ImageAsset extends StatelessWidget {
  const ImageAsset({this.webpAsset, this.width, this.height, super.key});

  final String? webpAsset;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final asset = webpAsset;

    final errorWidget = Icon(
      Icons.image,
      size: width?.toDouble() ?? 48,
      color: Colors.grey[400],
    );

    if (asset == null) {
      return errorWidget;
    }
    return Image.asset(
      asset,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        return errorWidget;
      },
    );
  }
}
