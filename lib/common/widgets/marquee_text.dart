import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final double gap;
  final String text;
  final TextStyle? style;
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
      );

    WidgetsBinding.instance.addPostFrameCallback((_) => _startScroll());
  }

  double _scrollWidth = 0.0;

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
