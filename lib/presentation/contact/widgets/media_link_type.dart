import 'package:portfolio/core/constants/string_constants.dart';

enum MediaLinkE {
  medium(title: StringC.medium, url: StringC.mediumUrl),
  stackOverflow(title: StringC.stackOverflow, url: StringC.stackOverflowUrl),
  email(title: StringC.email, url: StringC.emailUrl),
  linkedIn(title: StringC.linkedIn, url: StringC.linkedInUrl),
  resume(title: StringC.resume, url: StringC.resumeUrl);

  final String title;
  final String url;

  const MediaLinkE({required this.title, required this.url});
}
