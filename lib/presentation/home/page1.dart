import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';
import 'package:portfolio/core/utils/device/device_config.dart';

import '../../common/widgets/hover_underline_text.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Device().width * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 200),
          HoverUnderlineText(
            'Gautam',
            style: context.tt.titleLarge?.copyWith(fontSize: 200),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: HoverUnderlineText(
              'Manwani',
              style: context.tt.titleLarge?.copyWith(fontSize: 200),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'Flutter & Mobile Developer\nbuilding high-performance apps.',
            style: context.tt.titleSmall?.copyWith(
              fontSize: 50,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 200),
          Row(
            children: [
              Text(
                'Selected',
                style: context.tt.titleSmall?.copyWith(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ).expand(flex: 4),
              Padding(
                padding: const EdgeInsets.only(left: 32.0),
                child: Text(
                  'Work ',
                  style: context.tt.titleSmall?.copyWith(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ).expand(flex: 2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
