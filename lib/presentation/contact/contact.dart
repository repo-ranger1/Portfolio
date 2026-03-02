import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/asset_constants.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/launcher_util.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

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
          _buildLabel(context),
          SizedBox(height: context.spacing(32)),
          _buildTitle(context),
          SizedBox(height: context.spacing(24)),
          _buildSubtitle(context),
          SizedBox(height: context.spacing(80)),
          _buildContactLinks(context),
          SizedBox(height: context.spacing(80)),
          _buildEmail(context),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 1,
          color: AppColorRoyal.gold,
        ),
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
                  fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                  height: 1.1,
                  color: isItalic ? AppColorRoyal.gold : AppColorRoyal.cream,
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
        return _ContactLink(
          type: link.$1,
          icon: link.$2,
        );
      }).toList(),
    );
  }

  Widget _buildEmail(BuildContext context) {
    return GestureDetector(
      onTap: () => LauncherUtils.launchEmail(email: StringC.emailUrl),
      child: const MouseRegion(
        cursor: SystemMouseCursors.click,
        child: _HoverEmailText(
          email: StringC.emailUrl,
        ),
      ),
    );
  }
}

class _ContactLink extends StatefulWidget {
  final String icon;
  final MediaLinkE type;

  const _ContactLink({
    required this.type,
    required this.icon,
  });

  @override
  State<_ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<_ContactLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
          child: Column(
            children: [
              SvgPicture.asset(
                width: 40,
                height: 40,
                widget.icon,
                colorFilter: ColorFilter.mode(
                  _isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(height: context.spacing(16)),
              Text(
                widget.type.title.toUpperCase(),
                style: GoogleFonts.outfit(
                  fontSize: context.sp(12),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2,
                  color: _isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
                ),
              ),
              SizedBox(height: context.spacing(8)),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _isHovered ? 60 : 0,
                height: 1,
                color: AppColorRoyal.gold,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap() => LauncherUtils.launchLink(link: widget.type.url);
}

class _HoverEmailText extends StatefulWidget {
  final String email;

  const _HoverEmailText({required this.email});

  @override
  State<_HoverEmailText> createState() => _HoverEmailTextState();
}

class _HoverEmailTextState extends State<_HoverEmailText> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        children: [
          Text(
            widget.email,
            style: GoogleFonts.playfairDisplay(
              fontSize: context.byScreen(
                mobile: context.sp(24),
                tablet: context.sp(32),
                desktop: context.sp(40),
              ),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: AppColorRoyal.gold,
            ),
          ),
          SizedBox(height: context.spacing(4)),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: _isHovered ? 200 : 0,
            height: 1,
            color: AppColorRoyal.gold,
          ),
        ],
      ),
    );
  }
}
