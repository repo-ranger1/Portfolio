import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

import '../../../common/widgets/hover_underline_text.dart';
import '../../../common/widgets/hover_zoom_image.dart';
import '../../../core/utils/app/app_fonts.dart';
import '../work.dart';

class Project extends StatelessWidget {
  const Project({
    super.key,
    required this.project,
  });

  final ProjectsEnum project;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Widget image = HoverZoomImage(
      project.image,
      width: size.width,
      height: size.height,
    );

    // For mobile, stack the content vertically
    if (context.isMobile) {
      return SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: image,
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: project.color,
                padding: EdgeInsets.symmetric(
                  vertical: context.spacing(50),
                  horizontal: context.spacing(32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HoverUnderlineText(
                      project.name,
                      style: context.tt.titleLarge?.copyWith(
                        fontSize: context.sp(40),
                        color: project.textColor,
                      ),
                    ),
                    Text(
                      project.subtitle,
                      style: context.tt.titleLarge?.copyWith(
                        fontSize: context.sp(20),
                        color: project.textColor,
                        fontWeight: FontWeight.normal,
                        fontFamily: AppFonts.adventureOfTheOldGiant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    // For tablet and desktop, use horizontal layout
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Row(
        children: [
          if (project.index % 2 == 0) image.expand(flex: 4),
          Scaffold(
            backgroundColor: project.color,
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.spacing(100),
                horizontal: context.spacing(32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HoverUnderlineText(
                    project.name,
                    style: context.tt.titleLarge?.copyWith(
                      fontSize: context.sp(40),
                      color: project.textColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    project.subtitle,
                    style: context.tt.titleLarge?.copyWith(
                      fontSize: context.sp(20),
                      color: project.textColor,
                      fontWeight: FontWeight.normal,
                      fontFamily: AppFonts.adventureOfTheOldGiant,
                    ),
                  ),
                ],
              ),
            ),
          ).expand(flex: 2),
          if (project.index % 2 != 0) image.expand(flex: 4),
        ],
      ),
    );
  }
}
