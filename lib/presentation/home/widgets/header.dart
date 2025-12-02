import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

import '../../../domain/entities/module_entity.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.modules,
  });

  final List<ModuleEntity> modules;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColorRoyal.obsidian,
            AppColorRoyal.obsidian.withValues(alpha: 0.95),
            Colors.transparent,
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: context.spacing(32),
        horizontal: context.spacing(48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo - Clickable to scroll to top
          _LogoButton(onTap: _scrollToTop),

          // Navigation - Skip first module (Me/Landing)
          if (context.isMobile)
            _MobileMenu(
              modules: modules.skip(1).toList(),
              onModuleChange: (index) => _onModuleChange(index + 1),
            )
          else
            Row(
              spacing: context.spacing(40),
              children: List.generate(
                modules.length - 1,
                (i) {
                  final moduleIndex = i + 1; // Skip first module
                  return _NavLink(
                    title: modules[moduleIndex].title,
                    onTap: () => _onModuleChange(moduleIndex),
                  );
                },
              ).toList(),
            )
        ],
      ),
    );
  }

  void _scrollToTop() {
    final BuildContext? keyContext = modules[0].key.currentContext;

    if (keyContext == null) return;

    Scrollable.ensureVisible(
      keyContext,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 800),
    );
  }

  void _onModuleChange(int newModule) {
    final BuildContext? keyContext = modules[newModule].key.currentContext;

    if (keyContext == null) return;

    Scrollable.ensureVisible(
      keyContext,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
    );
  }
}

class _LogoButton extends StatefulWidget {
  final VoidCallback onTap;

  const _LogoButton({required this.onTap});

  @override
  State<_LogoButton> createState() => _LogoButtonState();
}

class _LogoButtonState extends State<_LogoButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: GoogleFonts.playfairDisplay(
            fontSize: context.sp(20),
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: _isHovered ? AppColorRoyal.cream : AppColorRoyal.gold,
          ),
          child: const Text(StringC.headerLogo),
        ),
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  final List<ModuleEntity> modules;
  final void Function(int) onModuleChange;

  const _MobileMenu({
    required this.modules,
    required this.onModuleChange,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Container(
        padding: EdgeInsets.all(context.spacing(8)),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColorRoyal.smoke.withValues(alpha: 0.3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          Icons.menu,
          size: context.spacing(20),
          color: AppColorRoyal.cream,
        ),
      ),
      color: AppColorRoyal.charcoal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: AppColorRoyal.smoke.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      offset: const Offset(0, 50),
      onSelected: onModuleChange,
      itemBuilder: (context) => List.generate(
        modules.length,
        (i) => PopupMenuItem(
          value: i,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.spacing(8),
              horizontal: context.spacing(8),
            ),
            child: Text(
              modules[i].title.toUpperCase(),
              style: GoogleFonts.outfit(
                fontSize: context.sp(12),
                letterSpacing: 2,
                color: AppColorRoyal.cream,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({required this.title, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing(16),
            vertical: context.spacing(8),
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _isHovered ? AppColorRoyal.gold : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.title.toUpperCase(),
            style: GoogleFonts.outfit(
              fontSize: context.sp(11),
              fontWeight: FontWeight.w500,
              letterSpacing: 2.5,
              color: _isHovered ? AppColorRoyal.gold : AppColorRoyal.cream,
            ),
          ),
        ),
      ),
    );
  }
}
