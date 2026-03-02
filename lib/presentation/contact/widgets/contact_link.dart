import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/widgets/magnetic_widget.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/launcher_util.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';
import 'package:portfolio/presentation/contact/widgets/media_link_type.dart';

class ContactLink extends StatefulWidget {
  final MediaLinkE type;
  final String icon;

  const ContactLink({super.key, required this.type, required this.icon});

  @override
  State<ContactLink> createState() => _ContactLinkState();
}

class _ContactLinkState extends State<ContactLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: MagneticWidget(
        magneticDistance: 80,
        magneticStrength: 0.2,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: () => LauncherUtils.launchLink(link: widget.type.url),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform:
                  Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    widget.icon,
                    width: 40,
                    height: 40,
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
                      color: _isHovered
                          ? AppColorRoyal.gold
                          : AppColorRoyal.cream,
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
        ),
      ),
    );
  }
}
