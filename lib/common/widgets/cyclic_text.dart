import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';

///Meditab Software Inc. CONFIDENTIAL
///__________________
///
/// [2025] Meditab Software Inc.
/// All Rights Reserved.
///
///NOTICE:  All information contained herein is, and remains
///the property of Meditab Software Inc. and its suppliers,
///if any.  The intellectual and technical concepts contained
///herein are proprietary to Meditab Software Incorporated
///and its suppliers and may be covered by U.S. and Foreign Patents,
///patents in process, and are protected by trade secret or copyright law.
///Dissemination of this information or reproduction of this material
///is strictly forbidden unless prior written permission is obtained
///from Meditab Software Incorporated.
///
///File Name: cyclic_text
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 13/05/25 15:26

class CyclingTextWidget extends StatefulWidget {
  final Duration pauseTime;
  final TextStyle? textStyle;
  final List<String> messages;
  final Duration animationTime;

  const CyclingTextWidget({
    super.key,
    this.textStyle,
    required this.messages,
    this.pauseTime = const Duration(seconds: 2),
    this.animationTime = const Duration(milliseconds: 500),
  });

  @override
  State<CyclingTextWidget> createState() => _CyclingTextWidgetState();
}

class _CyclingTextWidgetState extends State<CyclingTextWidget>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  bool _isVisible = true;
  late Timer _timer;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationTime,
    );

    _startCycling();
  }

  void _startCycling() {
    _timer = Timer.periodic(widget.pauseTime, (timer) {
      _controller.forward().then((_) {
        setState(() {
          _isVisible = false;
        });

        Future.delayed(widget.animationTime, () {
          setState(() {
            _currentIndex = (_currentIndex + 1) % widget.messages.length;
            _isVisible = true;
          });

          _controller.reset();
        });
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedOpacity(
            duration: widget.animationTime,
            opacity: _isVisible ? 1.0 : 0.0,
            child: Text(
              textAlign: TextAlign.center,
              overflow: TextOverflow.visible,
              widget.messages[_currentIndex],
              key: ValueKey<int>(_currentIndex),
              style: widget.textStyle ?? context.tt.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
