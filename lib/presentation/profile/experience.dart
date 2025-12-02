import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';
import 'package:portfolio/presentation/profile/profile.dart';

import '../../core/constants/string_constants.dart';

class Experiences extends StatelessWidget {
  const Experiences({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacing(24),
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringC.experience,
          style: context.tt.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.spacing(8)),
        ...List.generate(
          Experience.values.length,
          (i) => ListTile(
            tileColor: context.cs.surface,
            contentPadding: EdgeInsets.zero,
            trailing: Text(
              Experience.values[i].duration,
              style: context.tt.titleMedium,
            ),
            leading: Text(
              Experience.values[i].company,
              // '${Experience.values[i].company} / ${Experience.values[i].designation}',
              style: context.tt.titleLarge?.copyWith(
                fontSize: context.sp(24),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
