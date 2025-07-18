import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';

import '../../../common/widgets/hover_underline_text.dart';
import '../../../common/widgets/hover_zoom_image.dart';
import '../../../core/utils/app/app_fonts.dart';
import '../../../core/utils/device/device_config.dart';
import '../work.dart';

class Project extends StatelessWidget {
  const Project({
    super.key,
    required this.project,
  });

  final ProjectsEnum project;

  @override
  Widget build(BuildContext context) {
    final Widget image = HoverZoomImage(
      project.image,
      width: Device().width,
      height: Device().height,
    ).expand(flex: 4);

    return SizedBox(
      width: Device().width,
      height: Device().height,
      child: Row(
        children: [
          if (project.index % 2 == 0) image,
          Scaffold(
            backgroundColor: project.color,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HoverUnderlineText(
                    project.name,
                    style: context.tt.titleLarge?.copyWith(
                      fontSize: 40,
                      color: project.textColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    project.subtitle,
                    style: context.tt.titleLarge?.copyWith(
                      fontSize: 20,
                      color: project.textColor,
                      fontWeight: FontWeight.normal,
                      fontFamily: AppFonts.adventureOfTheOldGiant,
                    ),
                  ),
                ],
              ),
            ),
          ).expand(flex: 2),
          if (project.index % 2 != 0) image,
        ],
      ),
    );
  }
}
