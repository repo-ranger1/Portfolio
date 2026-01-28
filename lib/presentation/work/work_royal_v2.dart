import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/asset_constants.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/extensions/string_exntesion.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/launcher_util.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

enum ProjectType {
  imsGo(
    number: '01',
    category: StringC.imsGoCategory,
    title: StringC.imsGo,
    description: StringC.imsGoSubtitle,
    image: AssetC.imsgo,
    playStoreUrl: StringC.imsGoPlayStoreUrl,
    appStoreUrl: StringC.imsGoAppStoreUrl,
  ),
  imsCare(
    number: '02',
    category: StringC.imsCareCategory,
    title: StringC.imsCare,
    description: StringC.imsCareSubtitle,
    image: AssetC.imscare,
    playStoreUrl: StringC.imsCarePlayStoreUrl,
    appStoreUrl: StringC.imsCareAppStoreUrl,
  ),
  mydoses(
    number: '03',
    category: StringC.myDosesCategory,
    title: StringC.myDoses,
    description: StringC.myDosesSubtitle,
    image: AssetC.myDoses,
    playStoreUrl: StringC.myDosesPlayStoreUrl,
    appStoreUrl: StringC.myDosesAppStoreUrl,
  ),
  dosePack(
    number: '04',
    category: StringC.dosePackDeliveryCategory,
    title: StringC.dosePackDelivery,
    description: StringC.dosePackDeliverySubtitle,
    image: AssetC.dosePackDelivery,
    playStoreUrl: StringC.dosePackDeliveryPlayStoreUrl,
    appStoreUrl: StringC.dosePackDeliveryAppStoreUrl,
  ),
  masterpiece(
    number: '05',
    category: StringC.masterpieceStudioCategory,
    title: StringC.masterpieceStudio,
    description: StringC.masterpieceStudioSubtitle,
    image: AssetC.masterpieceStudio,
    // playStoreUrl: StringC.masterpieceStudioPlayStoreUrl,
    // appStoreUrl: StringC.masterpieceStudioAppStoreUrl,
  ),
  // cataractAI(
  //   number: '04',
  //   category: StringC.cataractAICategory,
  //   title: StringC.cataractAI,
  //   description: StringC.cataractAISubtitle,
  //   image: AssetC.cataractAI,
  //   playStoreUrl: StringC.cataractAIPlayStoreUrl,
  //   appStoreUrl: StringC.cataractAIAppStoreUrl,
  // ),
  // showItMax(
  //   number: '05',
  //   category: StringC.showItMaxCategory,
  //   title: StringC.showItMax,
  //   description: StringC.showItMaxSubtitle,
  //   image: AssetC.showItMax,
  //   playStoreUrl: StringC.showItMaxPlayStoreUrl,
  //   appStoreUrl: StringC.showItMaxAppStoreUrl,
  // )
  ;

  final String number;
  final String category;
  final String title;
  final String description;
  final String image;
  final String? playStoreUrl;
  final String? appStoreUrl;

  const ProjectType({
    required this.number,
    required this.category,
    required this.title,
    required this.description,
    required this.image,
    this.playStoreUrl,
    this.appStoreUrl,
  });
}

class WorkRoyalV2 extends StatelessWidget {
  const WorkRoyalV2({super.key});

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        _buildImage(context),

        // Content
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
          // Image
          Expanded(
            flex: 3,
            child: _buildImage(context),
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
    return Container(
      width: double.infinity,
      height: context.isMobile ? context.hp(40) : double.infinity,
      decoration: BoxDecoration(
        color: AppColorRoyal.charcoal,
        image: DecorationImage(
          image: AssetImage(widget.project.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              AppColorRoyal.obsidian.withValues(alpha: 0.3),
            ],
          ),
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
        if (widget.project.playStoreUrl.isNotNullOrEmpty)
          _StoreButton(
            icon: AssetC.playStore,
            label: StringC.playStoreLabel,
            onTap: () => LauncherUtils.launchLink(
                link: widget.project.playStoreUrl ?? ''),
            isHovered: _isHovered,
            isMobile: isMobile,
          ),
        if (widget.project.appStoreUrl.isNotNullOrEmpty)
          _StoreButton(
            icon: AssetC.appStore,
            label: StringC.appStoreLabel,
            onTap: () => LauncherUtils.launchLink(
                link: widget.project.appStoreUrl ?? ''),
            isHovered: _isHovered,
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
  final bool isHovered;
  final bool isMobile;

  const _StoreButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isHovered,
    required this.isMobile,
  });

  @override
  State<_StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<_StoreButton> {
  bool _isLocalHovered = false;

  @override
  Widget build(BuildContext context) {
    final isHovered = _isLocalHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isLocalHovered = true),
      onExit: (_) => setState(() => _isLocalHovered = false),
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
              color: isHovered ? AppColorRoyal.gold : AppColorRoyal.smoke,
              width: 1,
            ),
            color: isHovered
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
                  isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: context.spacing(8)),
              Text(
                widget.label.toUpperCase(),
                style: GoogleFonts.outfit(
                  fontSize: widget.isMobile ? context.sp(11) : context.sp(10),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                  color: isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
                ),
              ),
              SizedBox(width: context.spacing(8)),
              AnimatedRotation(
                turns: isHovered ? 0.125 : 0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.arrow_forward,
                  color: isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
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
