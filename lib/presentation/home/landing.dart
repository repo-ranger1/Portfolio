import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';
import 'package:portfolio/presentation/home/home.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollToWork() {
    // Get the work module key from home.dart
    final workContext = workKey.currentContext;
    if (workContext != null) {
      Scrollable.ensureVisible(
        workContext,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: AppColorRoyal.heroGradient,
      ),
      child: Stack(
        children: [
          // Animated floating lines in background
          ..._buildFloatingLines(),

          // Noise texture overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.02),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.wp(10),
                vertical: context.hp(5),
              ),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: size.height * 0.8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Eyebrow text
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Text(
                          StringC.heroEyebrow.toUpperCase(),
                          style: GoogleFonts.outfit(
                            fontSize: context.sp(12),
                            fontWeight: FontWeight.w400,
                            letterSpacing: 4,
                            color: AppColorRoyal.gold,
                          ),
                        ),
                      ),

                      SizedBox(height: context.spacing(32)),

                      // Hero title - animated
                      SlideTransition(
                        position: _slideAnimation,
                        child: FadeTransition(
                          opacity: _fadeAnimation,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // "Building apps"
                              Text(
                                StringC.heroTitle1,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: context.byScreen(
                                    mobile: context.sp(80),
                                    tablet: context.sp(120),
                                    desktop: context.sp(200),
                                  ),
                                  fontWeight: FontWeight.w400,
                                  height: 0.95,
                                  color: AppColorRoyal.cream,
                                ),
                              ),

                              // "that matter." with italic styling
                              ShaderMask(
                                shaderCallback: (bounds) => AppColorRoyal
                                    .goldGradient
                                    .createShader(bounds),
                                child: Text(
                                  StringC.heroTitle2,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: context.byScreen(
                                      mobile: context.sp(80),
                                      tablet: context.sp(120),
                                      desktop: context.sp(200),
                                    ),
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic,
                                    height: 0.95,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: context.spacing(48)),

                      // Tagline
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: context.byScreen(
                              mobile: context.wp(90),
                              tablet: context.wp(70),
                              desktop: 600,
                            ),
                          ),
                          child: Text(
                            StringC.heroTagline,
                            style: GoogleFonts.cormorantGaramond(
                              fontSize: context.sp(24),
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.italic,
                              color: AppColorRoyal.mist,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: context.spacing(64)),

                      // CTA Button
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: _HeroCTA(onTap: _scrollToWork),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Scroll indicator
          Positioned(
            bottom: context.spacing(64),
            left: 0,
            right: 0,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: _ScrollIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFloatingLines() {
    return List.generate(4, (index) {
      return Positioned(
        left: (10 + index * 20.0) % 90,
        top: (10 + index * 25.0) % 80,
        child: _FloatingLine(
          delay: index * 0.5,
          height: 120 + (index * 30.0),
        ),
      );
    });
  }
}

class _FloatingLine extends StatefulWidget {
  final double delay;
  final double height;

  const _FloatingLine({required this.delay, required this.height});

  @override
  State<_FloatingLine> createState() => _FloatingLineState();
}

class _FloatingLineState extends State<_FloatingLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (8 + widget.delay).toInt()),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: -30).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Container(
            width: 1,
            height: widget.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColorRoyal.gold.withValues(alpha: 0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HeroCTA extends StatefulWidget {
  final VoidCallback onTap;

  const _HeroCTA({required this.onTap});

  @override
  State<_HeroCTA> createState() => _HeroCTAState();
}

class _HeroCTAState extends State<_HeroCTA> {
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
          curve: Curves.easeOut,
          padding: EdgeInsets.symmetric(
            horizontal: context.spacing(40),
            vertical: context.spacing(18),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColorRoyal.gold,
              width: 1,
            ),
            color: _isHovered ? AppColorRoyal.gold : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'VIEW MY WORK',
                style: GoogleFonts.outfit(
                  fontSize: context.sp(14),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 3,
                  color:
                      _isHovered ? AppColorRoyal.obsidian : AppColorRoyal.gold,
                ),
              ),
              SizedBox(width: context.spacing(16)),
              AnimatedRotation(
                turns: _isHovered ? 0.125 : 0,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.arrow_forward,
                  color:
                      _isHovered ? AppColorRoyal.obsidian : AppColorRoyal.gold,
                  size: context.spacing(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScrollIndicator extends StatefulWidget {
  @override
  State<_ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<_ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SCROLL',
          style: GoogleFonts.outfit(
            fontSize: context.sp(10),
            letterSpacing: 3,
            color: AppColorRoyal.mist,
          ),
        ),
        SizedBox(height: context.spacing(16)),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: 1,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColorRoyal.gold
                        .withValues(alpha: 1 - _animation.value / 20),
                    Colors.transparent,
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
