import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';
import 'package:portfolio/presentation/contact/widgets/media_links.dart';

import '../../core/constants/string_constants.dart';
import '../home/widgets/footer.dart';

enum MediaLinkE {
  medium(title: StringC.medium, url: StringC.mediumUrl),
  stackOverflow(title: StringC.stackOverflow, url: StringC.stackOverflowUrl),
  email(title: StringC.email, url: StringC.emailUrl),
  linkedIn(title: StringC.linkedIn, url: StringC.linkedInUrl),
  resume(title: StringC.resume, url: StringC.resumeUrl);
  // phone(title: 'Phone', url: '+91 9924190188');

  final String title;
  final String url;

  const MediaLinkE({required this.title, required this.url});
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          const MediaLinks().center.expand(),
          const Footer(),
        ],
      ),
    );
  }
}
