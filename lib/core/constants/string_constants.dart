import 'package:portfolio/core/constants/variant.dart';
import 'package:portfolio/core/constants/variants/android_native_strings.dart';
import 'package:portfolio/core/constants/variants/flutter_android_strings.dart';
import 'package:portfolio/core/constants/variants/flutter_ios_strings.dart';
import 'package:portfolio/core/constants/variants/flutter_strings.dart';
import 'package:portfolio/core/constants/variants/ios_native_strings.dart';
import 'package:portfolio/core/constants/variants/native_strings.dart';

class StringC {
  StringC._();

  /// region Utility Strings
  static const String dateFormat = "MMM dd, yyyy";

  /// endregion

  /// region Header — same across all variants
  static const String headerLogo = 'Gautam Manwani';
  static const String me = 'Me';
  static const String work = 'Work';
  static const String profile = 'Profile';
  static const String contact = 'Contact';

  /// endregion

  /// region Identity — same across all variants
  static const String fullName = 'Gautam Manwani';
  static const String gautam = 'Gautam';
  static const String manwani = 'Manwani';

  /// endregion

  /// region Landing — variant-aware
  static String get heroEyebrow {
    if (Variant.isIOSNative) return IOSNativeStrings.heroEyebrow;
    if (Variant.isAndroidNative) return AndroidNativeStrings.heroEyebrow;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.heroEyebrow;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.heroEyebrow;
    if (Variant.isNative) return NativeStrings.heroEyebrow;
    return FlutterStrings.heroEyebrow;
  }

  static String get heroTitle1 {
    if (Variant.isIOSNative) return IOSNativeStrings.heroTitle1;
    if (Variant.isAndroidNative) return AndroidNativeStrings.heroTitle1;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.heroTitle1;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.heroTitle1;
    if (Variant.isNative) return NativeStrings.heroTitle1;
    return FlutterStrings.heroTitle1;
  }

  static String get heroTitle2 {
    if (Variant.isIOSNative) return IOSNativeStrings.heroTitle2;
    if (Variant.isAndroidNative) return AndroidNativeStrings.heroTitle2;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.heroTitle2;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.heroTitle2;
    if (Variant.isNative) return NativeStrings.heroTitle2;
    return FlutterStrings.heroTitle2;
  }

  static String get heroTagline {
    if (Variant.isIOSNative) return IOSNativeStrings.heroTagline;
    if (Variant.isAndroidNative) return AndroidNativeStrings.heroTagline;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.heroTagline;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.heroTagline;
    if (Variant.isNative) return NativeStrings.heroTagline;
    return FlutterStrings.heroTagline;
  }

  static String get landingSubtitle {
    if (Variant.isIOSNative) return IOSNativeStrings.landingSubtitle;
    if (Variant.isAndroidNative) return AndroidNativeStrings.landingSubtitle;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.landingSubtitle;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.landingSubtitle;
    if (Variant.isNative) return NativeStrings.landingSubtitle;
    return FlutterStrings.landingSubtitle;
  }

  /// endregion

  /// region Work — same across all variants
  static const String workLabel = 'Selected Work';
  static const String workTitle = 'Projects that speak.';

  static const String playStoreLabel = 'Play Store';
  static const String appStoreLabel = 'App Store';

  static const String masterpieceStudio = 'MasterPiece Studio';
  static const String masterpieceStudioCategory = 'Creative · Mobile';
  static const String masterpieceStudioSubtitle =
      "A visual journey through world-class art that makes browsing feel like an event. Custom animations, gesture-driven navigation, and immersive viewing modes that treat every artwork with the reverence it deserves.";
  static const String masterpieceStudioPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.masterpiece.studio';
  static const String masterpieceStudioAppStoreUrl =
      'https://apps.apple.com/app/masterpiece-studio/id1234567890';

  static const String dosePackDelivery = 'Doses Delivery';
  static const String dosePackDeliveryCategory = 'Healthcare · Logistics';
  static const String dosePackDeliverySubtitle =
      "Last-mile healthcare logistics, reimagined. Real-time tracking, intelligent route optimization, and delivery confirmation systems that ensure medications reach patients exactly when they need them. No excuses, no delays.";
  static const String dosePackDeliveryPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.dosepacker.mobiledelivery';
  static const String dosePackDeliveryAppStoreUrl =
      'https://apps.apple.com/in/app/doses-delivery/id6445919051';

  static const String myDoses = 'MyDoses';
  static const String myDosesCategory = 'Healthcare · Mobile';
  static const String myDosesSubtitle =
      "A medication management ecosystem that transforms how patients interact with their health. Intelligent reminders, prescription tracking, and seamless healthcare provider integration, because forgetting a dose shouldn't be an option.";
  static const String myDosesPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.dosepack.mydoses';
  static const String myDosesAppStoreUrl =
      'https://apps.apple.com/in/app/mydoses/id6502706157';

  static const String cataractAI = 'Cataract AI';
  static const String cataractAICategory = 'Healthcare · AI';
  static const String cataractAISubtitle =
      "AI-powered precision meets medical expertise. Real-time cataract detection that doesn't just analyze, it empowers ophthalmologists to catch what matters before it's too late. In-house ML models, HIPAA-compliant infrastructure, and a doctor-verification workflow that respects both technology and human judgment.";
  static const String cataractAIPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.cataract.ai';
  static const String cataractAIAppStoreUrl =
      'https://apps.apple.com/app/cataract-ai/id1234567890';

  static const String showItMax = 'ShowItMax';
  static const String showItMaxCategory = 'Enterprise · Media';
  static const String showItMaxSubtitle =
      "Presentations that don't just display, they captivate. A media powerhouse built for professionals who refuse to let connectivity dictate their impact. Stream, sync, and showcase with the confidence that your content performs flawlessly, whether you're online or miles from the nearest signal.";
  static const String showItMaxPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.showitmax.app';
  static const String showItMaxAppStoreUrl =
      'https://apps.apple.com/app/showitmax/id1234567890';

  static const String imsGo = 'IMSGo';
  static const String imsGoCategory = 'Healthcare · Mobile EHR';
  static const String imsGoSubtitle =
      "Mobile EHR that doesn't just digitize, it liberates. AI-powered ambient scribing, one-touch clinical records, and workflows built for physicians who refuse to sacrifice evenings to documentation. Two hours reclaimed, every day.";
  static const String imsGoPlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.meditab.imsgo&hl=en';
  static const String imsGoAppStoreUrl =
      'https://apps.apple.com/us/app/imsgo/id869811884';

  static const String imsCare = 'IMS Care';
  static const String imsCareCategory = 'Healthcare · Patient Portal';
  static const String imsCareSubtitle =
      "Healthcare engagement that actually engages. QR-code check-ins, parking lot arrivals, telemedicine with screen-sharing, and instant access to prescriptions, all without stepping foot in a waiting room.";
  static const String imsCarePlayStoreUrl =
      'https://play.google.com/store/apps/details?id=com.medpharm.imscare&hl=en_IN';
  static const String imsCareAppStoreUrl =
      'https://apps.apple.com/us/app/ims-care/id1638092813';

  /// endregion

  /// region Profile — variant-aware
  static const String experience = 'Experience';
  static const String aboutLabel = 'The Philosophy';

  static String get aboutTitle {
    if (Variant.isIOSNative) return IOSNativeStrings.aboutTitle;
    if (Variant.isAndroidNative) return AndroidNativeStrings.aboutTitle;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.aboutTitle;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.aboutTitle;
    if (Variant.isNative) return NativeStrings.aboutTitle;
    return FlutterStrings.aboutTitle;
  }

  static List<String> get aboutMe => [aboutMeP1, aboutMeP2, aboutMeP3, aboutMeP4];

  static String get aboutMeP1 {
    if (Variant.isIOSNative) return IOSNativeStrings.aboutP1;
    if (Variant.isAndroidNative) return AndroidNativeStrings.aboutP1;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.aboutP1;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.aboutP1;
    if (Variant.isNative) return NativeStrings.aboutP1;
    return FlutterStrings.aboutP1;
  }

  static String get aboutMeP2 {
    if (Variant.isIOSNative) return IOSNativeStrings.aboutP2;
    if (Variant.isAndroidNative) return AndroidNativeStrings.aboutP2;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.aboutP2;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.aboutP2;
    if (Variant.isNative) return NativeStrings.aboutP2;
    return FlutterStrings.aboutP2;
  }

  static String get aboutMeP3 {
    if (Variant.isIOSNative) return IOSNativeStrings.aboutP3;
    if (Variant.isAndroidNative) return AndroidNativeStrings.aboutP3;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.aboutP3;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.aboutP3;
    if (Variant.isNative) return NativeStrings.aboutP3;
    return FlutterStrings.aboutP3;
  }

  static String get aboutMeP4 {
    if (Variant.isIOSNative) return IOSNativeStrings.aboutP4;
    if (Variant.isAndroidNative) return AndroidNativeStrings.aboutP4;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.aboutP4;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.aboutP4;
    if (Variant.isNative) return NativeStrings.aboutP4;
    return FlutterStrings.aboutP4;
  }

  static const String availableForInquire =
      ' · AVAILABLE FOR · FREELANCING INQUIRES';
  static const String meditabSoftware = 'Meditab Software';
  static const String teamElemental = 'Team Elemental';
  static const String crownSoftware = 'Crown Software';
  static const String meditabSoftwareTenor = 'Dec 2022 - Present';
  static const String teamElementalTenor = 'Apr 2022 - July 2022';
  static const String crownSoftwareTenor = 'Apr 2021 - July 2021';
  static const String programmerAnalyst = 'Programmer Analyst';
  static const String softwareDeveloper = 'Software Developer';

  /// endregion

  /// region Contact — same across all variants
  static const String contactLabel = "Let's Talk";
  static const String contactTitle = "Ready to build\nsomething remarkable?";
  static const String contactSubtitle =
      "I'm always open to discussing new projects, creative ideas, or opportunities to be part of something extraordinary.";
  static const String medium = 'Medium';
  static const String mediumUrl = 'http://gautam007.medium.com';
  static const String instagram = 'Instagram';
  static const String instagramUrl = 'https://instagram.com/gautammanwani';
  static const String email = 'Email';
  static const String emailUrl = 'gautammanwani04@gmail.com';
  static const String linkedIn = 'LinkedIn';
  static const String linkedInUrl =
      'https://www.linkedin.com/in/gautam-manwani-462495230/';
  static const String resume = 'Resume';
  static String get resumeUrl {
    if (Variant.isIOSNative) return IOSNativeStrings.resumeUrl;
    if (Variant.isAndroidNative) return AndroidNativeStrings.resumeUrl;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.resumeUrl;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.resumeUrl;
    if (Variant.isNative) return NativeStrings.resumeUrl;
    return FlutterStrings.resumeUrl;
  }
  static const String stackOverflow = 'Stack Overflow';
  static const String stackOverflowUrl =
      'https://stackoverflow.com/users/21977414/pixel';

  /// endregion

  /// region Footer — variant-aware
  static String get craftedWithPassion {
    if (Variant.isIOSNative) return IOSNativeStrings.craftedWithPassion;
    if (Variant.isAndroidNative) return AndroidNativeStrings.craftedWithPassion;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.craftedWithPassion;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.craftedWithPassion;
    if (Variant.isNative) return NativeStrings.craftedWithPassion;
    return FlutterStrings.craftedWithPassion;
  }

  /// endregion

  /// region Skills Marquee — variant-aware
  static List<String> get skills {
    if (Variant.isIOSNative) return IOSNativeStrings.skills;
    if (Variant.isAndroidNative) return AndroidNativeStrings.skills;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.skills;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.skills;
    if (Variant.isNative) return NativeStrings.skills;
    return FlutterStrings.skills;
  }

  /// endregion

  /// region Project keys — which projects to show per variant
  static List<String> get projectKeys {
    if (Variant.isIOSNative) return IOSNativeStrings.projectKeys;
    if (Variant.isAndroidNative) return AndroidNativeStrings.projectKeys;
    if (Variant.isFlutterIOS) return FlutterIOSStrings.projectKeys;
    if (Variant.isFlutterAndroid) return FlutterAndroidStrings.projectKeys;
    if (Variant.isNative) return NativeStrings.projectKeys;
    return FlutterStrings.projectKeys;
  }

  /// endregion
}
