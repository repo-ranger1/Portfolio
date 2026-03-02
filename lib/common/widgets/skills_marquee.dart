import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';

/// Animated marquee displaying skills in an infinite horizontal scroll
class SkillsMarquee extends StatefulWidget {
  const SkillsMarquee({super.key});

  @override
  State<SkillsMarquee> createState() => _SkillsMarqueeState();
}

class _SkillsMarqueeState extends State<SkillsMarquee>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 30),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHoverChange(bool isHovered) {
    setState(() => _isHovered = isHovered);
    if (isHovered) {
      // Slow down to 20% speed
      _controller.animateTo(
        _controller.value,
        duration: Duration.zero,
      );
      _controller.duration = const Duration(seconds: 150); // 5x slower
      _controller.repeat();
    } else {
      // Back to normal speed
      _controller.animateTo(
        _controller.value,
        duration: Duration.zero,
      );
      _controller.duration = const Duration(seconds: 30);
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHoverChange(true),
      onExit: (_) => _onHoverChange(false),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColorRoyal.charcoal,
          border: Border(
            top: BorderSide(color: AppColorRoyal.smoke, width: 1),
            bottom: BorderSide(color: AppColorRoyal.smoke, width: 1),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return CustomPaint(
              painter: _MarqueePainter(_animation.value, isHovered: _isHovered),
              size: Size(MediaQuery.of(context).size.width, 80),
            );
          },
        ),
      ),
    );
  }
}

class _MarqueePainter extends CustomPainter {
  final double animation;
  final bool isHovered;
  static const List<String> skills = StringC.skills;

  _MarqueePainter(this.animation, {this.isHovered = false});

  @override
  void paint(Canvas canvas, Size size) {
    final textStyle = GoogleFonts.playfairDisplay(
      fontSize: 32,
      fontStyle: FontStyle.italic,
      color: AppColorRoyal.cream.withValues(alpha: 0.4),
    );

    final goldTextStyle = GoogleFonts.playfairDisplay(
      fontSize: 32,
      fontStyle: FontStyle.italic,
      color: AppColorRoyal.gold,
    );

    final dotPaint = Paint()
      ..color = AppColorRoyal.gold
      ..style = PaintingStyle.fill;

    // Calculate total width needed for one set of items
    double itemSpacing = 64;
    double dotSpacing = 8;
    double totalWidth = 0;

    for (int i = 0; i < skills.length; i++) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: skills[i],
          style: i % 3 == 0 ? goldTextStyle : textStyle,
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      totalWidth += textPainter.width + itemSpacing + dotSpacing * 2 + 8;
    }

    // Calculate offset based on animation
    double offset = -animation * totalWidth;

    // Draw two sets to create seamless loop
    for (int set = 0; set < 3; set++) {
      double x = offset + (set * totalWidth);

      for (int i = 0; i < skills.length; i++) {
        final isGold = i % 3 == 0;
        final textPainter = TextPainter(
          text: TextSpan(
            text: skills[i],
            style: isGold ? goldTextStyle : textStyle,
          ),
          textDirection: TextDirection.ltr,
        )..layout();

        // Draw text
        textPainter.paint(
          canvas,
          Offset(x, size.height / 2 - textPainter.height / 2),
        );

        x += textPainter.width + itemSpacing;

        // Draw dot
        canvas.drawCircle(
          Offset(x, size.height / 2),
          4,
          dotPaint,
        );

        x += dotSpacing * 2 + 8;
      }
    }
  }

  @override
  bool shouldRepaint(_MarqueePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
