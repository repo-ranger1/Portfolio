import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/device/device_config.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 200,
        horizontal: Device().width * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringC.gautam,
            style: context.tt.titleLarge?.copyWith(fontSize: 200),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: Text(
              StringC.manwani,
              style: context.tt.titleLarge?.copyWith(fontSize: 200),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            StringC.landingSubtitle,
            style: context.tt.titleSmall?.copyWith(
              fontSize: 50,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
