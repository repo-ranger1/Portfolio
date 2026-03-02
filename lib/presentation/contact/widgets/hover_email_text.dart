import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

class HoverEmailText extends StatefulWidget {
  final String email;

  const HoverEmailText({super.key, required this.email});

  @override
  State<HoverEmailText> createState() => _HoverEmailTextState();
}

class _HoverEmailTextState extends State<HoverEmailText>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Column(
          children: [
            ShaderMask(
              shaderCallback: (bounds) => _isHovered
                  ? AppColorRoyal.goldGradient.createShader(bounds)
                  : const LinearGradient(
                      colors: [AppColorRoyal.gold, AppColorRoyal.gold],
                    ).createShader(bounds),
              child: Text(
                widget.email,
                style: GoogleFonts.playfairDisplay(
                  fontSize: context.byScreen(
                    mobile: context.sp(24),
                    tablet: context.sp(32),
                    desktop: context.sp(40),
                  ),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: context.spacing(4)),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              width: _isHovered ? 200 : 0,
              height: 2,
              decoration: BoxDecoration(
                gradient: AppColorRoyal.goldGradient,
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: AppColorRoyal.gold.withValues(alpha: 0.5),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
