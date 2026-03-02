import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColorRoyal.charcoal,
      padding: EdgeInsets.symmetric(
        horizontal: context.wp(10),
        vertical: context.hp(12),
      ),
      child: context.isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel(context),
                SizedBox(height: context.spacing(24)),
                _buildTitle(context),
                SizedBox(height: context.spacing(64)),
                _buildContent(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel(context),
                      SizedBox(height: context.spacing(24)),
                      _buildTitle(context),
                    ],
                  ),
                ),
                SizedBox(width: context.spacing(80)),
                Expanded(
                  flex: 3,
                  child: _buildContent(context),
                ),
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
          StringC.aboutLabel.toUpperCase(),
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
    final parts = StringC.aboutTitle.split('\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          parts[0],
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
        if (parts.length > 1)
          ShaderMask(
            shaderCallback: (bounds) =>
                AppColorRoyal.goldGradient.createShader(bounds),
            child: Text(
              parts[1],
              style: GoogleFonts.playfairDisplay(
                fontSize: context.byScreen(
                  mobile: context.sp(48),
                  tablet: context.sp(64),
                  desktop: context.sp(72),
                ),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
                height: 1.1,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: StringC.aboutMe.asMap().entries.map((entry) {
        final index = entry.key;
        final text = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            bottom: index < StringC.aboutMe.length - 1 ? context.spacing(32) : 0,
          ),
          child: _buildParagraph(context, text, isFirst: index == 0),
        );
      }).toList(),
    );
  }

  Widget _buildParagraph(BuildContext context, String text, {bool isFirst = false}) {
    if (isFirst) {
      // First paragraph with drop cap
      final firstLetter = text[0];
      final restOfText = text.substring(1);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            firstLetter,
            style: GoogleFonts.playfairDisplay(
              fontSize: context.sp(80),
              fontWeight: FontWeight.w400,
              height: 0.8,
              color: AppColorRoyal.gold,
            ),
          ),
          SizedBox(width: context.spacing(8)),
          Expanded(
            child: Text(
              restOfText,
              style: GoogleFonts.cormorantGaramond(
                fontSize: context.sp(22),
                fontWeight: FontWeight.w400,
                height: 1.8,
                color: AppColorRoyal.cream,
              ),
            ),
          ),
        ],
      );
    }

    return Text(
      text,
      style: GoogleFonts.cormorantGaramond(
        fontSize: context.sp(22),
        fontWeight: FontWeight.w400,
        height: 1.8,
        color: AppColorRoyal.cream,
      ),
    );
  }
}
