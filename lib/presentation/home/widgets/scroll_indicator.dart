import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

class ScrollIndicator extends StatefulWidget {
  const ScrollIndicator({super.key});

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 20).animate(
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
    return Column(
      children: [
        Text(
          'SCROLL',
          style: GoogleFonts.outfit(
            fontSize: context.sp(10),
            letterSpacing: 3,
            color: AppColorRoyal.mist,
          ),
        ),
        SizedBox(height: context.spacing(16)),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: 1,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColorRoyal.gold
                        .withValues(alpha: 1 - _animation.value / 20),
                    Colors.transparent,
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
