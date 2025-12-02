import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';
import 'package:portfolio/presentation/profile/profile.dart';

class ExperienceRoyal extends StatelessWidget {
  const ExperienceRoyal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColorRoyal.charcoal,
            AppColorRoyal.obsidian,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.wp(10),
        vertical: context.hp(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(context),
          SizedBox(height: context.spacing(24)),
          _buildTitle(context),
          SizedBox(height: context.spacing(80)),
          _buildTimeline(context),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 1,
          color: AppColorRoyal.gold,
        ),
        SizedBox(width: context.spacing(16)),
        Text(
          'THE JOURNEY',
          style: GoogleFonts.outfit(
            fontSize: context.sp(12),
            fontWeight: FontWeight.w400,
            letterSpacing: 4,
            color: AppColorRoyal.gold,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Where I\'ve ',
            style: GoogleFonts.playfairDisplay(
              fontSize: context.byScreen(
                mobile: context.sp(48),
                tablet: context.sp(64),
                desktop: context.sp(72),
              ),
              fontWeight: FontWeight.w400,
              height: 1.1,
              color: AppColorRoyal.cream,
            ),
          ),
          TextSpan(
            text: 'honed',
            style: GoogleFonts.playfairDisplay(
              fontSize: context.byScreen(
                mobile: context.sp(48),
                tablet: context.sp(64),
                desktop: context.sp(72),
              ),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              height: 1.1,
              color: AppColorRoyal.gold,
            ),
          ),
          TextSpan(
            text: ' my craft.',
            style: GoogleFonts.playfairDisplay(
              fontSize: context.byScreen(
                mobile: context.sp(48),
                tablet: context.sp(64),
                desktop: context.sp(72),
              ),
              fontWeight: FontWeight.w400,
              height: 1.1,
              color: AppColorRoyal.cream,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: context.byScreen(
          mobile: double.infinity,
          tablet: 900,
          desktop: 900,
        ),
      ),
      child: Column(
        children: Experience.values.asMap().entries.map((entry) {
          return _TimelineItem(
            experience: entry.value,
            isLast: entry.key == Experience.values.length - 1,
          );
        }).toList(),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final Experience experience;
  final bool isLast;

  const _TimelineItem({
    required this.experience,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: isLast ? 0 : context.spacing(80),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line and dot
          Column(
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColorRoyal.gold,
                    width: 2,
                  ),
                  color: AppColorRoyal.obsidian,
                ),
              ),
              if (!isLast)
                Container(
                  width: 1,
                  height: context.spacing(200),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColorRoyal.gold,
                        AppColorRoyal.goldDark,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(width: context.spacing(64)),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Duration
                Text(
                  experience.duration.toUpperCase(),
                  style: GoogleFonts.outfit(
                    fontSize: context.sp(12),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                    color: AppColorRoyal.gold,
                  ),
                ),

                SizedBox(height: context.spacing(12)),

                // Role
                Text(
                  experience.designation,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: context.byScreen(
                      mobile: context.sp(32),
                      tablet: context.sp(40),
                      desktop: context.sp(40),
                    ),
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                    color: AppColorRoyal.cream,
                  ),
                ),

                SizedBox(height: context.spacing(8)),

                // Company
                Text(
                  experience.company,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: context.sp(22),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: AppColorRoyal.mist,
                  ),
                ),

                SizedBox(height: context.spacing(24)),

                // Description
                Text(
                  _getDescription(experience),
                  style: GoogleFonts.outfit(
                    fontSize: context.sp(16),
                    fontWeight: FontWeight.w400,
                    height: 1.8,
                    color: AppColorRoyal.cream.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getDescription(Experience exp) {
    switch (exp) {
      case Experience.meditab:
        return "Leading the mobile frontier in healthcare technology. I don't just build apps here—I architect digital ecosystems that thousands of healthcare professionals rely on daily. Spearheading mission-critical applications, establishing clean architecture patterns, and mentoring developers who share the obsession for excellence.";
      case Experience.teamElement:
        return "Cut my teeth in environments where deadlines are tight and only the adaptable survive. Delivered pixel-perfect implementations, integrated complex third-party services, and established testing protocols that drastically reduced production bugs.";
      case Experience.crown:
        return "Where it all began. Discovered mobile development and never looked back. Built prototype applications, collaborated with senior developers, and laid the foundation for a career built on curiosity and precision.";
    }
  }
}
