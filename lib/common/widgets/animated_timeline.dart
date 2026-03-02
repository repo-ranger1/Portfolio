import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';

/// An animated timeline dot and line that draws when scrolled into view
class AnimatedTimelineDot extends StatefulWidget {
  final bool isLast;
  final double lineHeight;
  final Duration delay;

  const AnimatedTimelineDot({
    super.key,
    required this.isLast,
    this.lineHeight = 200,
    this.delay = Duration.zero,
  });

  @override
  State<AnimatedTimelineDot> createState() => _AnimatedTimelineDotState();
}

class _AnimatedTimelineDotState extends State<AnimatedTimelineDot>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _lineAnimation;
  late Animation<double> _pulseAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Dot scale animation
    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.3, curve: Curves.elasticOut),
    ));

    // Line draw animation
    _lineAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOutCubic),
    ));

    // Pulse animation
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Start pulsing after main animation completes
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            _pulseController.repeat(reverse: true);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_hasAnimated && info.visibleFraction > 0.1) {
      _hasAnimated = true;
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('timeline_${widget.hashCode}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Column(
        children: [
          // Animated dot with pulse
          ScaleTransition(
            scale: _scaleAnimation,
            child: AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColorRoyal.gold,
                      width: 2,
                    ),
                    color: AppColorRoyal.obsidian,
                    boxShadow: [
                      BoxShadow(
                        color: AppColorRoyal.gold.withValues(
                          alpha: 0.3 * _pulseAnimation.value,
                        ),
                        blurRadius: 8 * _pulseAnimation.value,
                        spreadRadius: 2 * _pulseAnimation.value,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Animated line
          if (!widget.isLast)
            AnimatedBuilder(
              animation: _lineAnimation,
              builder: (context, child) {
                return ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: _lineAnimation.value,
                    child: Container(
                      width: 1,
                      height: widget.lineHeight,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColorRoyal.gold,
                            AppColorRoyal.goldDark,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
