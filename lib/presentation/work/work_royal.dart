import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

enum ProjectType {
  mydoses(
    number: '01',
    category: StringC.myDosesCategory,
    title: StringC.myDoses,
    description: StringC.myDosesSubtitle,
    technologies: ['Flutter', 'BLoC', 'REST APIs', 'Local DB'],
  ),
  dosePack(
    number: '02',
    category: StringC.dosePackDeliveryCategory,
    title: StringC.dosePackDelivery,
    description: StringC.dosePackDeliverySubtitle,
    technologies: ['Flutter', 'Google Maps', 'Push Notifications', 'Real-time Sync'],
  ),
  masterpiece(
    number: '03',
    category: StringC.masterpieceStudioCategory,
    title: StringC.masterpieceStudio,
    description: StringC.masterpieceStudioSubtitle,
    technologies: ['Flutter', 'Custom Painter', 'Hero Animations', 'Image Caching'],
  );

  final String number;
  final String category;
  final String title;
  final String description;
  final List<String> technologies;

  const ProjectType({
    required this.number,
    required this.category,
    required this.title,
    required this.description,
    required this.technologies,
  });
}

class WorkRoyal extends StatelessWidget {
  const WorkRoyal({super.key});

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

          // Projects
          ...ProjectType.values.asMap().entries.map((entry) {
            return _ProjectCard(
              project: entry.value,
              index: entry.key,
            );
          }),
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
            text: '${parts[0]} ',
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
            text: parts[1],
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

class _ProjectCard extends StatefulWidget {
  final ProjectType project;
  final int index;

  const _ProjectCard({
    required this.project,
    required this.index,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isEven = widget.index % 2 == 0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColorRoyal.smoke, width: 1),
          ),
        ),
        child: context.isMobile
            ? _buildMobileLayout(context)
            : _buildDesktopLayout(context, isEven),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProjectNumber(context),
          SizedBox(height: context.spacing(16)),
          _buildCategory(context),
          SizedBox(height: context.spacing(16)),
          _buildTitle(context),
          SizedBox(height: context.spacing(24)),
          _buildDescription(context),
          SizedBox(height: context.spacing(24)),
          _buildTechnologies(context),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, bool isEven) {
    return SizedBox(
      height: context.byScreen(
        mobile: null,
        tablet: 500,
        desktop: 600,
      ),
      child: Row(
        textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
        children: [
          // Visual placeholder (would be image in real app)
          Expanded(
            flex: 3,
            child: Container(
              color: AppColorRoyal.charcoal,
              child: Center(
                child: Text(
                  widget.project.number,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: context.sp(120),
                    fontStyle: FontStyle.italic,
                    color: AppColorRoyal.gold.withValues(alpha: 0.15),
                  ),
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(context.spacing(64)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProjectNumber(context),
                  SizedBox(height: context.spacing(16)),
                  _buildCategory(context),
                  SizedBox(height: context.spacing(16)),
                  _buildTitle(context),
                  SizedBox(height: context.spacing(24)),
                  _buildDescription(context),
                  SizedBox(height: context.spacing(32)),
                  _buildTechnologies(context),
                  SizedBox(height: context.spacing(32)),
                  _buildViewButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectNumber(BuildContext context) {
    return Text(
      widget.project.number,
      style: GoogleFonts.playfairDisplay(
        fontSize: context.sp(80),
        fontWeight: FontWeight.w400,
        height: 1,
        color: AppColorRoyal.gold.withValues(alpha: 0.3),
      ),
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Text(
      widget.project.category.toUpperCase(),
      style: GoogleFonts.outfit(
        fontSize: context.sp(12),
        fontWeight: FontWeight.w400,
        letterSpacing: 3,
        color: AppColorRoyal.mist,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      widget.project.title,
      style: GoogleFonts.playfairDisplay(
        fontSize: context.byScreen(
          mobile: context.sp(32),
          tablet: context.sp(40),
          desktop: context.sp(48),
        ),
        fontWeight: FontWeight.w400,
        height: 1.2,
        color: AppColorRoyal.cream,
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      widget.project.description,
      style: GoogleFonts.cormorantGaramond(
        fontSize: context.sp(20),
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: AppColorRoyal.mist,
      ),
      maxLines: context.isMobile ? null : 4,
      overflow: context.isMobile ? null : TextOverflow.ellipsis,
    );
  }

  Widget _buildTechnologies(BuildContext context) {
    return Wrap(
      spacing: context.spacing(12),
      runSpacing: context.spacing(12),
      children: widget.project.technologies.map((tech) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing(16),
            vertical: context.spacing(8),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColorRoyal.smoke,
              width: 1,
            ),
          ),
          child: Text(
            tech.toUpperCase(),
            style: GoogleFonts.outfit(
              fontSize: context.sp(10),
              fontWeight: FontWeight.w400,
              letterSpacing: 1.5,
              color: AppColorRoyal.cream,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildViewButton(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'EXPLORE PROJECT',
            style: GoogleFonts.outfit(
              fontSize: context.sp(12),
              fontWeight: FontWeight.w400,
              letterSpacing: 2,
              color: _isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
            ),
          ),
          SizedBox(width: context.spacing(12)),
          AnimatedRotation(
            turns: _isHovered ? 0.125 : 0,
            duration: const Duration(milliseconds: 300),
            child: Icon(
              Icons.arrow_forward,
              color: _isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
              size: context.spacing(20),
            ),
          ),
        ],
      ),
    );
  }
}
