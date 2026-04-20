import 'package:portfolio/core/constants/string_constants.dart';

enum MediaLinkE {
  medium,
  stackOverflow,
  email,
  linkedIn,
  resume;

  String get title => switch (this) {
        MediaLinkE.medium => StringC.medium,
        MediaLinkE.stackOverflow => StringC.stackOverflow,
        MediaLinkE.email => StringC.email,
        MediaLinkE.linkedIn => StringC.linkedIn,
        MediaLinkE.resume => StringC.resume,
      };

  String get url => switch (this) {
        MediaLinkE.medium => StringC.mediumUrl,
        MediaLinkE.stackOverflow => StringC.stackOverflowUrl,
        MediaLinkE.email => StringC.emailUrl,
        MediaLinkE.linkedIn => StringC.linkedInUrl,
        MediaLinkE.resume => StringC.resumeUrl,
      };
}
