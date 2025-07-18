///Meditab Software Inc. CONFIDENTIAL
///__________________
///
/// [2025] Meditab Software Inc.
/// All Rights Reserved.
///
///NOTICE:  All information contained herein is, and remains
///the property of Meditab Software Inc. and its suppliers,
///if any.  The intellectual and technical concepts contained
///herein are proprietary to Meditab Software Incorporated
///and its suppliers and may be covered by U.S. and Foreign Patents,
///patents in process, and are protected by trade secret or copyright law.
///Dissemination of this information or reproduction of this material
///is strictly forbidden unless prior written permission is obtained
///from Meditab Software Incorporated.
///
///File Name: string_constants
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 09/05/25 13:27
class StringC {
  StringC._();

  /// region Utility Strings
  static const String dateFormat = "MMM dd, yyyy";

  /// endregion

  /// region Header
  static const String me = 'Me';
  static const String work = 'Work';
  static const String profile = 'Profile';
  static const String contact = 'Contact';

  /// endregion

  /// region Landing
  static const String fullName = 'Gautam Manwani';
  static const String gautam = 'Gautam';
  static const String manwani = 'Manwani';
  static const String landingSubtitle =
      'Flutter & Mobile Developer\nbuilding high-performance apps.';

  /// endregion

  /// region Work
  static const String masterpieceStudio = 'MasterPiece\nStudio';
  static const String masterpieceStudioSubtitle =
      "A visual journey through world-class art, right from your fingertips.\nIt’s making fine art feel personal, accessible, and maybe even addictive.";
  static const String dosePackDelivery = 'DosePack\nDelivery';
  static const String dosePackDeliverySubtitle =
      "Built for real-time logistics — maps, navigation, and status updates that don’t miss a beat.\nIt’s changing how essential meds reach homes, one seamless delivery at a time.";
  static const String myDoses = 'MyDoses';
  static const String myDosesSubtitle =
      "Smart medication tracking that just works — even when your phone doesn’t.\nIt’s helping people stay on schedule, stay safe, and stay independent.";

  /// endregion

  /// region profile
  static const String experience = 'Experience';
  static const List<String> aboutMe = [
    StringC.aboutMeP1,
    StringC.aboutMeP2,
    StringC.aboutMeP3
  ];
  static const String aboutMeP1 =
      "I’m a cross-platform mobile developer who cares about building apps that not only work — but feel right. From healthcare tools that support daily well-being to art apps that inspire curiosity, I turn ideas into clean, intuitive digital experiences. Flutter is my playground, but clarity, performance, and human-centered design are what really guide my work.";
  static const String aboutMeP2 =
      "Whether I’m diving into navigation systems or crafting delightful animations, I focus on writing maintainable code and delivering real-world impact. I thrive in teams that value both creativity and precision — and I believe the best products come from thoughtful collaboration.";
  static const String aboutMeP3 =
      "Got something in mind? I’m always up for meaningful projects and curious conversations. Let’s build something that matters.";
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

  /// region Contact
  static const String medium = 'Medium';
  static const String mediumUrl = 'http://gautam007.medium.com';
  static const String email = 'Email';
  static const String emailUrl = 'gautammanwani04@gmail.com';
  static const String linkedIn = 'LinkedIn';
  static const String linkedInUrl =
      'https://www.linkedin.com/in/gautam-manwani-462495230/';
  static const String stackOverflow = 'Stack Overflow';
  static const String stackOverflowUrl =
      'https://stackoverflow.com/users/21977414/pixel';

  /// endregion

  /// region Footer
  static const String craftedWithPassion = "@ Crafted By Me with Passion.";

  /// endregion
}
