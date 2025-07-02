import 'package:flutter/material.dart';

class HoverZoomImage extends StatelessWidget {
  final double width;
  final double height;
  final String assetPath;

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
