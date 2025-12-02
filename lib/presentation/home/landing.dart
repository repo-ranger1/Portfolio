import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.spacing(200),
        horizontal: context.wp(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringC.gautam,
            style: context.tt.titleLarge?.copyWith(
              fontSize: context.sp(200),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: context.spacing(80)),
            child: Text(
              StringC.manwani,
              style: context.tt.titleLarge?.copyWith(
                fontSize: context.sp(200),
              ),
            ),
          ),
          SizedBox(height: context.spacing(40)),
          Text(
            StringC.landingSubtitle,
            style: context.tt.titleSmall?.copyWith(
              fontSize: context.sp(50),
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class AdvancedTiltContainer extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;
  final double maxTilt;
  final bool enableLightEffect;
  final Color lightColor;
  final BorderRadius? borderRadius;

  const AdvancedTiltContainer({
    super.key,
    required this.child,
    this.width = 300,
    this.height = 200,
    this.maxTilt = 20.0,
    this.enableLightEffect = true,
    this.lightColor = Colors.white24,
    this.borderRadius,
  });

  @override
  State<AdvancedTiltContainer> createState() => _AdvancedTiltContainerState();
}

class _AdvancedTiltContainerState extends State<AdvancedTiltContainer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  double _tiltX = 0.0;
  double _tiltY = 0.0;
  Offset _lightPosition = Offset.zero;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateHover(Offset localPosition) {
    final centerX = widget.width / 2;
    final centerY = widget.height / 2;

    setState(() {
      // Calculate tilt
      _tiltX = ((localPosition.dy - centerY) / centerY) * widget.maxTilt;
      _tiltY = ((localPosition.dx - centerX) / centerX) * -widget.maxTilt;

      // Calculate light position
      _lightPosition = Offset(
        localPosition.dx / widget.width,
        localPosition.dy / widget.height,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovering = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
          _tiltX = 0.0;
          _tiltY = 0.0;
        });
        _controller.reverse();
      },
      onHover: (v) => _updateHover(v.position),
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 200),
        tween: Tween(begin: 0.0, end: _isHovering ? 1.0 : 0.0),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX((_tiltX * value) * math.pi / 180)
              ..rotateY((_tiltY * value) * math.pi / 180)
              ..scale(1.0 + (0.05 * value)),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15 + (0.1 * value)),
                    blurRadius: 20 + (20 * value),
                    spreadRadius: 5 + (10 * value),
                    offset: Offset(
                      (_tiltY * value) * 0.3,
                      8 + ((_tiltX * value) * 0.3),
                    ),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
                child: Stack(
                  children: [
                    widget.child,
                    if (widget.enableLightEffect && _isHovering)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: widget.borderRadius ??
                                BorderRadius.circular(20),
                            gradient: RadialGradient(
                              center: Alignment(
                                (_lightPosition.dx - 0.5) * 2,
                                (_lightPosition.dy - 0.5) * 2,
                              ),
                              radius: 0.8,
                              colors: [
                                widget.lightColor.withValues(alpha: 0.3 * value),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
