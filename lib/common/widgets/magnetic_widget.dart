import 'package:flutter/material.dart';

/// A widget that creates a magnetic effect - pulls toward the cursor when nearby
class MagneticWidget extends StatefulWidget {
  final Widget child;
  final double magneticDistance;
  final double magneticStrength;

  const MagneticWidget({
    super.key,
    required this.child,
    this.magneticDistance = 100,
    this.magneticStrength = 0.3,
  });

  @override
  State<MagneticWidget> createState() => _MagneticWidgetState();
}

class _MagneticWidgetState extends State<MagneticWidget> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final localPosition = box.globalToLocal(event.position);
        final size = box.size;

        // Calculate center of widget
        final center = Offset(size.width / 2, size.height / 2);

        // Calculate distance from cursor to center
        final distance = (localPosition - center).distance;

        // Only apply magnetic effect if within range
        if (distance < widget.magneticDistance) {
          setState(() {
            final direction = localPosition - center;
            _offset = direction * widget.magneticStrength;
          });
        } else {
          setState(() => _offset = Offset.zero);
        }
      },
      onExit: (_) => setState(() => _offset = Offset.zero),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(_offset.dx, _offset.dy, 0),
        child: widget.child,
      ),
    );
  }
}
