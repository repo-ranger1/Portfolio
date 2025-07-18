import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';

/// Widget that displays text with an animated underline on mouse hover.
///
/// Useful for links, buttons, or interactive text elements.
class HoverUnderlineText extends StatefulWidget {
  /// The string to display.
  final String text;
  /// Optional text style.
  final TextStyle? style;

  const HoverUnderlineText(
    this.text, {
    super.key,
    this.style,
  });

  @override
  State<HoverUnderlineText> createState() => _HoverUnderlineTextState();
}

class _HoverUnderlineTextState extends State<HoverUnderlineText> {
  bool _hovering = false;
  double _textWidth = 0;

  @override
  void initState() {
    super.initState();
    // Calculate the width of the text for the underline animation.
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    _textWidth = textPainter.width;
  }

  @override
  Widget build(BuildContext context) {
    // MouseRegion tracks hover state to trigger underline animation.
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.text, style: widget.style ?? context.tt.titleLarge),
          AnimatedContainer(
            height: 2,
            curve: Curves.easeInOut,
            alignment: Alignment.centerLeft,
            width: _hovering ? _textWidth : 0,
            color: widget.style?.color ?? Colors.black,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
