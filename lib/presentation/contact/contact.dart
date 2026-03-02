import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/widgets/scroll_reveal.dart';
import 'package:portfolio/core/constants/asset_constants.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/launcher_util.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';
import 'package:portfolio/presentation/contact/widgets/contact_link.dart';
import 'package:portfolio/presentation/contact/widgets/hover_email_text.dart';
import 'package:portfolio/presentation/contact/widgets/media_link_type.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColorRoyal.obsidian,
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.0,
          colors: [
            AppColorRoyal.royalPurple.withValues(alpha: 0.4),
            AppColorRoyal.obsidian,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.wp(10),
        vertical: context.hp(15),
      ),
      child: Column(
        children: [
          ScrollReveal(
            duration: const Duration(milliseconds: 600),
            child: _buildLabel(context),
          ),
          SizedBox(height: context.spacing(32)),
          ScrollReveal(
            delay: const Duration(milliseconds: 150),
            duration: const Duration(milliseconds: 700),
            child: _buildTitle(context),
          ),
          SizedBox(height: context.spacing(24)),
          ScrollReveal(
            delay: const Duration(milliseconds: 300),
            duration: const Duration(milliseconds: 600),
            child: _buildSubtitle(context),
          ),
          SizedBox(height: context.spacing(80)),
          ScrollReveal(
            delay: const Duration(milliseconds: 450),
            duration: const Duration(milliseconds: 700),
            child: _buildContactLinks(context),
          ),
          SizedBox(height: context.spacing(80)),
          ScrollReveal(
            delay: const Duration(milliseconds: 600),
            duration: const Duration(milliseconds: 700),
            child: _buildEmail(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 40, height: 1, color: AppColorRoyal.gold),
        SizedBox(width: context.spacing(16)),
        Text(
          StringC.contactLabel.toUpperCase(),
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
    final lines = StringC.contactTitle.split('\n');
    return Column(
      children: lines.map((line) {
        final words = line.split(' ');
        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: words.asMap().entries.map((entry) {
              final isLast = entry.key == words.length - 1;
              final isItalic = isLast && line == lines.last;

              return TextSpan(
                text: '${entry.value}${isLast ? '' : ' '}',
                style: GoogleFonts.playfairDisplay(
                  fontSize: context.byScreen(
                    mobile: context.sp(48),
                    tablet: context.sp(64),
                    desktop: context.sp(96),
                  ),
                  fontWeight: FontWeight.w400,
                  fontStyle:
                      isItalic ? FontStyle.italic : FontStyle.normal,
                  height: 1.1,
                  color:
                      isItalic ? AppColorRoyal.gold : AppColorRoyal.cream,
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: context.byScreen(
          mobile: context.wp(90),
          tablet: 600,
          desktop: 600,
        ),
      ),
      child: Text(
        StringC.contactSubtitle,
        textAlign: TextAlign.center,
        style: GoogleFonts.cormorantGaramond(
          fontSize: context.sp(24),
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          height: 1.6,
          color: AppColorRoyal.mist,
        ),
      ),
    );
  }

  Widget _buildContactLinks(BuildContext context) {
    final links = [
      (MediaLinkE.linkedIn, AssetC.linkedin),
      (MediaLinkE.stackOverflow, AssetC.stackOverflow),
      (MediaLinkE.resume, AssetC.resume),
      (MediaLinkE.medium, AssetC.medium),
    ];

    return Wrap(
      spacing: context.spacing(48),
      runSpacing: context.spacing(48),
      alignment: WrapAlignment.center,
      children: links.map((link) {
        return ContactLink(type: link.$1, icon: link.$2);
      }).toList(),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return GestureDetector(
      onTap: () => LauncherUtils.launchEmail(email: StringC.emailUrl),
      child: const MouseRegion(
        cursor: SystemMouseCursors.click,
        child: HoverEmailText(email: StringC.emailUrl),
      ),
    );
  }
}
