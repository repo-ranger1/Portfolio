import 'package:flutter/material.dart';

/// Widget that creates a horizontally scrolling marquee effect for a single line of text.
///
/// Useful for news tickers, headlines, or any continuously scrolling text.
class MarqueeText extends StatefulWidget {
  /// The string to display in the marquee.
  final String text;
  /// Optional text style.
  final TextStyle? style;
  /// Space between repeated text instances.
  final double gap;
  /// Time taken for one full scroll cycle.
  final Duration duration;

  const MarqueeText({
    super.key,
    this.style,
    this.gap = 20.0,
    required this.text,
    this.duration = const Duration(seconds: 8),
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(
        () => _scrollController.jumpTo(_controller.value * _scrollWidth),
      ); // Sync scroll position with animation controller.

    WidgetsBinding.instance.addPostFrameCallback((_) => _startScroll()); // Start scrolling after layout.
  }

  double _scrollWidth = 0.0;

  /// Calculates the scroll width and starts the marquee animation.
  void _startScroll() {
    final textWidth = _textKey.currentContext?.size?.width ?? 0;

    _scrollWidth = textWidth + widget.gap;
    _controller.repeat();
  }

  final GlobalKey _textKey = GlobalKey();
  final GlobalKey _containerKey = GlobalKey();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            key: _containerKey,
            height: (widget.style?.fontSize ?? 20) + 8,
            width: constraints.maxWidth,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Text(
                      widget.text,
                      key: index == 0 ? _textKey : null,
                      style: widget.style,
                    ),
                    SizedBox(width: widget.gap),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
