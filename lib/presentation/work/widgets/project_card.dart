import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/asset_constants.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/constants/variant.dart';
import 'package:portfolio/core/extensions/string_exntesion.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/launcher_util.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';
import 'package:portfolio/presentation/work/widgets/project_type.dart';

class ProjectCard extends StatefulWidget {
  final ProjectType project;
  final int index;

  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImage(context),
        Padding(
          padding: EdgeInsets.all(context.spacing(40)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProjectNumber(context, isMobile: true),
              SizedBox(height: context.spacing(16)),
              _buildCategory(context, isMobile: true),
              SizedBox(height: context.spacing(20)),
              _buildTitle(context, isMobile: true),
              SizedBox(height: context.spacing(28)),
              _buildDescription(context, isMobile: true),
              SizedBox(height: context.spacing(40)),
              _buildStoreButtons(context, isMobile: true),
            ],
          ),
        ),
      ],
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
          Expanded(flex: 3, child: _buildImage(context)),
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
                  Flexible(child: _buildDescription(context)),
                  SizedBox(height: context.spacing(32)),
                  _buildStoreButtons(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRect(
      child: Container(
        width: double.infinity,
        height: context.isMobile ? context.hp(40) : double.infinity,
        color: AppColorRoyal.charcoal,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              scale: _isHovered ? 1.08 : 1.0,
              child: Image.asset(widget.project.image, fit: BoxFit.cover),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColorRoyal.obsidian.withValues(
                      alpha: _isHovered ? 0.5 : 0.3,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectNumber(BuildContext context, {bool isMobile = false}) {
    return Text(
      widget.project.number,
      style: GoogleFonts.playfairDisplay(
        fontSize: isMobile ? context.sp(60) : context.sp(80),
        fontWeight: FontWeight.w400,
        height: 1,
        color: AppColorRoyal.gold.withValues(alpha: 0.3),
      ),
    );
  }

  Widget _buildCategory(BuildContext context, {bool isMobile = false}) {
    return Text(
      widget.project.category.toUpperCase(),
      style: GoogleFonts.outfit(
        fontSize: isMobile ? context.sp(11) : context.sp(12),
        fontWeight: FontWeight.w400,
        letterSpacing: 3,
        color: AppColorRoyal.mist,
      ),
    );
  }

  Widget _buildTitle(BuildContext context, {bool isMobile = false}) {
    return Text(
      widget.project.title,
      style: GoogleFonts.playfairDisplay(
        fontSize: isMobile
            ? context.sp(36)
            : context.byScreen(
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

  Widget _buildDescription(BuildContext context, {bool isMobile = false}) {
    return Text(
      widget.project.description,
      style: GoogleFonts.cormorantGaramond(
        fontSize: isMobile ? context.sp(18) : context.sp(20),
        fontWeight: FontWeight.w400,
        height: 1.7,
        color: AppColorRoyal.mist,
      ),
      maxLines: isMobile ? null : 5,
      overflow: isMobile ? TextOverflow.visible : TextOverflow.ellipsis,
    );
  }

  Widget _buildStoreButtons(BuildContext context, {bool isMobile = false}) {
    return Wrap(
      spacing: context.spacing(16),
      runSpacing: context.spacing(16),
      children: [
        if (Variant.showPlayStore && widget.project.playStoreUrl.isNotNullOrEmpty)
          _StoreButton(
            icon: AssetC.playStore,
            label: StringC.playStoreLabel,
            onTap: () => LauncherUtils.launchLink(
                link: widget.project.playStoreUrl ?? ''),
            isMobile: isMobile,
          ),
        if (Variant.showAppStore && widget.project.appStoreUrl.isNotNullOrEmpty)
          _StoreButton(
            icon: AssetC.appStore,
            label: StringC.appStoreLabel,
            onTap: () => LauncherUtils.launchLink(
                link: widget.project.appStoreUrl ?? ''),
            isMobile: isMobile,
          ),
      ],
    );
  }
}

class _StoreButton extends StatefulWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;
  final bool isMobile;

  const _StoreButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isMobile,
  });

  @override
  State<_StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<_StoreButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(
            horizontal:
                widget.isMobile ? context.spacing(20) : context.spacing(16),
            vertical:
                widget.isMobile ? context.spacing(12) : context.spacing(10),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: _isHovered ? AppColorRoyal.gold : AppColorRoyal.smoke,
              width: 1,
            ),
            color: _isHovered
                ? AppColorRoyal.gold.withValues(alpha: 0.1)
                : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                widget.icon,
                width: widget.isMobile ? 20 : 18,
                height: widget.isMobile ? 20 : 18,
                colorFilter: ColorFilter.mode(
                  _isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: context.spacing(8)),
              Text(
                widget.label.toUpperCase(),
                style: GoogleFonts.outfit(
                  fontSize:
                      widget.isMobile ? context.sp(11) : context.sp(10),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  color: _isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
                ),
              ),
              SizedBox(width: context.spacing(8)),
              AnimatedRotation(
                turns: _isHovered ? 0.125 : 0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.arrow_forward,
                  color: _isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
                  size: widget.isMobile ? 16 : 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
