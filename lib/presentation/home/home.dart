import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/widgets/skills_marquee.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';
import 'package:portfolio/presentation/contact/contact_royal.dart';
import 'package:portfolio/presentation/home/landing_royal.dart';
import 'package:portfolio/presentation/home/widgets/header.dart';
import 'package:portfolio/presentation/profile/experience_royal.dart';
import 'package:portfolio/presentation/profile/profile_royal.dart';
import 'package:portfolio/presentation/work/work_royal_v2.dart';

import '../../domain/entities/module_entity.dart';

// GlobalKeys for identifying individual modules.
final GlobalKey meKey = GlobalKey();
final GlobalKey workKey = GlobalKey();
final GlobalKey profileKey = GlobalKey();
final GlobalKey experienceKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

/// [Home] — The main persistent page of the website.
/// Displays all modules in a single scrollable list,
/// with a fixed header at the top.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Collection of all available modules displayed on the website.
  late final List<ModuleEntity> _modules;

  @override
  void initState() {
    // Populating the module.
    // Note: The first module (landing page) is not shown in navigation
    _modules = [
      ModuleEntity(
        key: meKey,
        title: StringC.me,
        page: LandingRoyal(key: meKey),
      ),
      ModuleEntity(
        key: profileKey,
        title: StringC.profile,
        page: ProfileRoyal(key: profileKey),
      ),
      ModuleEntity(
        key: workKey,
        title: StringC.work,
        page: WorkRoyalV2(key: workKey),
      ),
      ModuleEntity(
        key: experienceKey,
        title: StringC.experience,
        page: ExperienceRoyal(key: experienceKey),
      ),
      ModuleEntity(
        key: contactKey,
        title: StringC.contact,
        page: ContactRoyal(key: contactKey),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorRoyal.obsidian,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Hero landing section
                _modules[0].page,
                // Skills marquee
                const SkillsMarquee(),
                // Profile/About section
                _modules[1].page,
                // Work/Projects section
                _modules[2].page,
                // Experience section
                _modules[3].page,
                // Contact section
                _modules[4].page,
                // Footer
                _Footer(),
              ],
            ).parentWidth,
          ),
          Header(modules: _modules),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColorRoyal.obsidian,
        border: Border(
          top: BorderSide(color: AppColorRoyal.smoke, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.wp(10),
        vertical: context.spacing(48),
      ),
      child: context.isMobile
          ? Column(
              children: [
                _buildLeft(context),
                SizedBox(height: context.spacing(24)),
                _buildRight(context),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLeft(context),
                _buildRight(context),
              ],
            ),
    );
  }

  Widget _buildLeft(BuildContext context) {
    return Text(
      '© ${DateTime.now().year} ${StringC.fullName}',
      style: GoogleFonts.playfairDisplay(
        fontSize: context.sp(16),
        color: AppColorRoyal.mist,
      ),
    );
  }

  Widget _buildRight(BuildContext context) {
    return Text(
      StringC.craftedWithPassion,
      textAlign: context.isMobile ? TextAlign.center : TextAlign.right,
      style: GoogleFonts.outfit(
        fontSize: context.sp(12),
        letterSpacing: 1,
        color: AppColorRoyal.mist,
      ),
    );
  }
}
