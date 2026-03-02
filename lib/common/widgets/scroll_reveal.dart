import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// A widget that animates its child when scrolled into view
/// Supports fade-in and slide-up animations
class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final double slideDistance;
  final bool slideFromBottom;
  final bool slideFromLeft;
  final bool slideFromRight;

  const ScrollReveal({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.curve = Curves.easeOutCubic,
    this.slideDistance = 30.0,
    this.slideFromBottom = true,
    this.slideFromLeft = false,
    this.slideFromRight = false,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    // Determine slide direction
    Offset beginOffset;
    if (widget.slideFromBottom) {
      beginOffset = Offset(0, widget.slideDistance / 100);
    } else if (widget.slideFromLeft) {
      beginOffset = Offset(-widget.slideDistance / 100, 0);
    } else if (widget.slideFromRight) {
      beginOffset = Offset(widget.slideDistance / 100, 0);
    } else {
      beginOffset = Offset(0, widget.slideDistance / 100);
    }

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_hasAnimated && info.visibleFraction > 0.15) {
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
      key: Key('scroll_reveal_${widget.child.hashCode}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}
