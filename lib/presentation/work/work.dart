import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/widgets/scroll_reveal.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';
import 'package:portfolio/presentation/work/widgets/project_card.dart';
import 'package:portfolio/presentation/work/widgets/project_type.dart';

class Work extends StatelessWidget {
  const Work({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColorRoyal.obsidian,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.wp(10),
              vertical: context.hp(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel(context),
                SizedBox(height: context.spacing(24)),
                _buildTitle(context),
              ],
            ),
          ),

          // Projects with staggered scroll animation
          ...variantProjects.asMap().entries.map((entry) {
            return ScrollReveal(
              delay: Duration(milliseconds: entry.key * 150),
              duration: const Duration(milliseconds: 800),
              slideDistance: 60,
              child: ProjectCard(
                project: entry.value,
                index: entry.key,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Row(
      children: [
        Container(width: 40, height: 1, color: AppColorRoyal.gold),
        SizedBox(width: context.spacing(16)),
        Text(
          StringC.workLabel.toUpperCase(),
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
    final parts = StringC.workTitle.split(' ');
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${parts[0]} ${parts[1]} ',
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
            text: parts[2],
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
        ],
      ),
    );
  }
}
