import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';

class FloatingLine extends StatefulWidget {
  final double delay;
  final double height;

  const FloatingLine({super.key, required this.delay, required this.height});

  @override
  State<FloatingLine> createState() => _FloatingLineState();
}

class _FloatingLineState extends State<FloatingLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (8 + widget.delay).toInt()),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: -30).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Container(
            width: 1,
            height: widget.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColorRoyal.gold.withValues(alpha: 0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
