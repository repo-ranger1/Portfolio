import 'package:flutter/material.dart';

import '../../core/utils/app/app_color.dart';

class CursorFollower extends StatefulWidget {
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
    return MouseRegion(
      onHover: (event) async {
        await Future.delayed(const Duration(milliseconds: 100));
        _cursorReBuilder?.call(() => _mousePosition = event.position);
      },
      child: Stack(
        children: [
          // Your actual content here
          widget.child,

          // The round cursor follower
          StatefulBuilder(builder: (context, sst) {
            _cursorReBuilder ??= sst;
            return Positioned(
              left: _mousePosition.dx - 10,
              top: _mousePosition.dy - 10,
              child: IgnorePointer(
                // So it doesn't block mouse input
                child: AnimatedContainer(
                  width: 20,
                  height: 20,
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
