import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

import '../../../common/widgets/hover_underline_text.dart';
import '../../../core/utils/launcher_util.dart';
import '../contact.dart';

class MediaLinks extends StatelessWidget {
  const MediaLinks({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine cross axis count based on screen type
    final int crossAxisCount = context.byScreen(
      mobile: 1, // Stack vertically on mobile
      tablet: 2, // 2 columns on tablet
      desktop: MediaLinkE.values.length, // All in one row on desktop
    );

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: MediaLinkE.values.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: context.spacing(20),
        crossAxisSpacing: context.spacing(20),
      ),
      itemBuilder: (context, i) => GestureDetector(
        onTap: () => _onMediaLinkTap(MediaLinkE.values[i]),
        child: HoverUnderlineText(
          MediaLinkE.values[i].title,
          style: context.tt.titleLarge?.copyWith(
            fontSize: context.sp(32),
          ),
        ).center,
      ),
    );
  }

  void _onMediaLinkTap(final MediaLinkE type) {
    switch (type) {
      case MediaLinkE.medium:
      case MediaLinkE.resume:
      case MediaLinkE.linkedIn:
      case MediaLinkE.stackOverflow:
        LauncherUtils.launchLink(link: type.url);
        break;
      case MediaLinkE.email:
        LauncherUtils.launchEmail(email: type.url);
        break;
      // case MediaLinkE.phone:
      //   LauncherUtils.launchLink(link: type.url);
      //   break;
    }
  }
}
