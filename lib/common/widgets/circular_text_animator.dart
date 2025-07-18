import 'dart:math';

import 'package:flutter/material.dart';

class CircularTextAnimator extends StatefulWidget {
  final String text;

  final double radius;

  final TextStyle? textStyle;

  final Widget centerWidget;

  final Duration animationDuration;

  const CircularTextAnimator({
    super.key,
    required this.text,
    this.radius = 120.0,
    this.textStyle = const TextStyle(fontSize: 20, color: Colors.blueGrey),
    required this.centerWidget,
    this.animationDuration = const Duration(seconds: 15),
  });

  @override
  State<CircularTextAnimator> createState() => _CircularTextAnimatorState();
}

class _CircularTextAnimatorState extends State<CircularTextAnimator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    )..repeat();
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double maxCharHeight = widget.textStyle?.fontSize ?? 0.0;
    final double paintSize = (widget.radius * 2) + (maxCharHeight * 2);

    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CustomPaint(
              painter: _CircularTextPainter(
                text: widget.text,
                radius: widget.radius,
                textStyle: widget.textStyle,
                animationValue: _animation.value,
              ),
              size: Size.square(paintSize),
            ),
            widget.centerWidget,
          ],
        );
      },
    );
  }
}

class _CircularTextPainter extends CustomPainter {
  final String text;

  final double radius;

  final TextStyle? textStyle;

  final double animationValue;

  _CircularTextPainter({
    this.textStyle,
    required this.text,
    required this.radius,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);

    if (text.isEmpty) {
      return;
    }

    const double totalCircleAngle = 2 * pi;

    final double anglePerChar = totalCircleAngle / text.length;

    final double baseRotationAngle =
        -pi / 2 + (animationValue * totalCircleAngle);

    for (int i = 0; i < text.length; i++) {
      final String char = text[i];
      final TextSpan charSpan = TextSpan(text: char, style: textStyle);
      final TextPainter charPainter = TextPainter(
        text: charSpan,
        textDirection: TextDirection.ltr,
      );
      charPainter.layout();

      final double charWidth = charPainter.width;
      final double charHeight = charPainter.height;

      final double charCenterAngle =
          baseRotationAngle + (i * anglePerChar) + (anglePerChar / 2);

      final double x = center.dx + radius * cos(charCenterAngle);
      final double y = center.dy + radius * sin(charCenterAngle);

      canvas
        ..save()
        ..translate(x, y)
        ..rotate(charCenterAngle + pi / 2);

      charPainter.paint(canvas, Offset(-charWidth / 2, -charHeight / 2));

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _CircularTextPainter oldDelegate) =>
      oldDelegate.text != text ||
      oldDelegate.radius != radius ||
      oldDelegate.textStyle != textStyle ||
      oldDelegate.animationValue != animationValue;
}
