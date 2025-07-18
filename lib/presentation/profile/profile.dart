import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/asset_constants.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/presentation/home/home.dart';

import '../../common/widgets/circular_text_animator.dart';
import '../../core/utils/device/device_config.dart';
import 'experience.dart';

enum Experience {
  meditab(
    company: StringC.meditabSoftware,
    duration: StringC.meditabSoftwareTenor,
    designation: StringC.programmerAnalyst,
  ),
  teamElement(
    company: StringC.teamElemental,
    duration: StringC.teamElementalTenor,
    designation: StringC.softwareDeveloper,
  ),
  crown(
    company: StringC.crownSoftware,
    duration: StringC.crownSoftwareTenor,
    designation: StringC.softwareDeveloper,
  );

  const Experience({
    required this.company,
    required this.duration,
    required this.designation,
  });

  final String company;
  final String duration;
  final String designation;
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Device().height * 0.1,
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Device().width * 0.1,
                ),
                child: Image.asset(AssetC.projectGroup),
              ),
              Positioned(
                right: 12,
                child: CircularTextAnimator(
                  radius: 80,
                  textStyle: context.tt.titleLarge,
                  text: StringC.availableForInquire,
                  animationDuration: const Duration(seconds: 25),
                  centerWidget: IconButton(
                    onPressed: _scrollToContact,
                    icon: const Icon(CupertinoIcons.down_arrow),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Device().height * 0.1),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Device().width * 0.1,
            ),
            child: Column(
              children: [
                Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    StringC.aboutMe.length,
                    (i) => Text(
                      StringC.aboutMe[i],
                      style: context.tt.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Device().height * 0.1),
                const Experiences(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToContact() {
    final BuildContext? keyContext = contactKey.currentContext;

    if (keyContext == null) return;
    Scrollable.ensureVisible(
      keyContext,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
    );
  }
}
