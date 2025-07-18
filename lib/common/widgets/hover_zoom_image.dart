import 'package:flutter/material.dart';

/// Widget that displays an image which zooms in slightly when hovered by the mouse.
///
/// Useful for interactive galleries or cards to provide visual feedback.
class HoverZoomImage extends StatelessWidget {
  /// Path to the image asset.
  final String assetPath;
  /// Width of the image.
  final double width;
  /// Height of the image.
  final double height;

  const HoverZoomImage(
    this.assetPath, {
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    bool hovering = false;

    return StatefulBuilder(
      builder: (context, setState) => MouseRegion(
        onEnter: (_) => setState(() => hovering = true),
        onExit: (_) => setState(() => hovering = false),
        child: ClipRect(
          child: AnimatedScale(
            curve: Curves.decelerate,
            scale: hovering ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              assetPath,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
