import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

class HeroCTA extends StatefulWidget {
  final VoidCallback onTap;

  const HeroCTA({super.key, required this.onTap});

  @override
  State<HeroCTA> createState() => _HeroCTAState();
}

class _HeroCTAState extends State<HeroCTA> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isPressed ? 0.95 : 1.0,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            padding: EdgeInsets.symmetric(
              horizontal: context.spacing(40),
              vertical: context.spacing(18),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppColorRoyal.gold, width: 1),
              color: _isHovered ? AppColorRoyal.gold : Colors.transparent,
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppColorRoyal.gold.withValues(alpha: 0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'VIEW MY WORK',
                  style: GoogleFonts.outfit(
                    fontSize: context.sp(14),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3,
                    color: _isHovered
                        ? AppColorRoyal.obsidian
                        : AppColorRoyal.gold,
                  ),
                ),
                SizedBox(width: context.spacing(16)),
                AnimatedRotation(
                  turns: _isHovered ? 0.125 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    Icons.arrow_forward,
                    color: _isHovered
                        ? AppColorRoyal.obsidian
                        : AppColorRoyal.gold,
                    size: context.spacing(20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
