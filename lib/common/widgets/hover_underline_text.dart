import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';

class HoverUnderlineText extends StatefulWidget {
  final String text;
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
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    _textWidth = textPainter.width;
  }

  @override
  Widget build(BuildContext context) {
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
