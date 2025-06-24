import 'package:flutter/material.dart';
import 'package:portfolio/common/widgets/hover_underline_text.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';
import 'package:portfolio/core/utils/launcher_util.dart';
import 'package:portfolio/core/utils/launcher_util.dart';
import 'package:portfolio/core/utils/launcher_util.dart';
import 'package:portfolio/core/utils/launcher_util.dart';
import 'package:portfolio/core/utils/launcher_util.dart';

import '../../../core/utils/device/device_config.dart';

enum MediaLinkE {
  medium(
    title: 'Medium',
    url: 'http://gautam007.medium.com',
  ),
  email(
    title: 'Email',
    url: 'gautammanwani04@gmail.com',
  ),
  linkedIn(
    title: 'LinkedIn',
    url: 'https://www.linkedin.com/in/gautam-manwani-462495230/',
  ),
  stackOverflow(
    title: 'Stack Overflow',
    url: 'https://stackoverflow.com/users/21977414/pixel',
  );
  // phone(
  //   title: 'Phone',
  //   url: '+91 9924190188',
  // );

  final String title;
  final String url;

  const MediaLinkE({required this.title, required this.url});
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: Device().width,
        height: Device().height,
        child: Column(
          children: [
            const _MediaLinks().center.expand(),
            const Footer(),
          ],
        ),
      );
}

class _MediaLinks extends StatelessWidget {
  const _MediaLinks();

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

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        StringC.craftedWithPassion,
        style: context.tt.titleLarge,
      ),
    );
  }
}
