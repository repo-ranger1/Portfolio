import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';

import '../../../common/widgets/hover_underline_text.dart';
import '../../../core/utils/launcher_util.dart';
import '../contact.dart';

class MediaLinks extends StatelessWidget {
  const MediaLinks({super.key});

  @override
  Widget build(BuildContext context) => GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: MediaLinkE.values.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaLinkE.values.length,
        ),
        itemBuilder: (context, i) => GestureDetector(
          onTap: () => _onMediaLinkTap(MediaLinkE.values[i]),
          child: HoverUnderlineText(
            MediaLinkE.values[i].title,
            style: context.tt.titleLarge?.copyWith(fontSize: 32),
          ).center,
        ),
      );

  void _onMediaLinkTap(final MediaLinkE type) {
    switch (type) {
      case MediaLinkE.medium:
        LauncherUtils.launchLink(link: type.url);
        break;
      case MediaLinkE.email:
        LauncherUtils.launchEmail(email: type.url);
        break;
      case MediaLinkE.linkedIn:
        LauncherUtils.launchLink(link: type.url);
        break;
      case MediaLinkE.stackOverflow:
        LauncherUtils.launchLink(link: type.url);
        break;
      // case MediaLinkE.phone:
      //   LauncherUtils.launchLink(link: type.url);
      //   break;
    }
  }
}
