import 'package:flutter/material.dart';

import '../../core/utils/app/app_color.dart';

/// Widget that displays a circular cursor following the mouse pointer over its child.
///
/// Useful for custom cursor effects or interactive UI feedback.
class CursorFollower extends StatefulWidget {
  /// The widget subtree over which the custom cursor will follow the mouse.
  const CursorFollower({super.key, required this.child});

  final Widget child;

  @override
  State<CursorFollower> createState() => _CursorFollowerState();
}

class _CursorFollowerState extends State<CursorFollower> {
  Offset _mousePosition = Offset.zero;
  ValueChanged<VoidCallback>? _cursorReBuilder;

  @override
  Widget build(BuildContext context) {
    // MouseRegion tracks mouse movement and triggers cursor updates.
    return MouseRegion(
      onHover: (event) async {
        await Future.delayed(const Duration(milliseconds: 100));
        _cursorReBuilder?.call(() => _mousePosition = event.position);
      },
      child: Stack(
        children: [
          widget.child, // Main content.

          // The round cursor follower overlay.
          StatefulBuilder(builder: (context, sst) {
            _cursorReBuilder ??= sst;
            return Positioned(
              left: _mousePosition.dx - 20,
              top: _mousePosition.dy - 20,
              child: IgnorePointer(
                // Prevents the overlay from blocking mouse input.
                child: AnimatedContainer(
                  width: 40,
                  height: 40,
                  duration: const Duration(milliseconds: 100),
                  child: const ClipOval(
                    child: BackdropFilter(
                      filter: ColorFilter.matrix(AppColor.colorInverter),
                      child: SizedBox.shrink(),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
