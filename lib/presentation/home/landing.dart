import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/widgets/magnetic_widget.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/utils/app/app_color_royal.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';
import 'package:portfolio/presentation/home/home.dart';
import 'package:portfolio/presentation/home/widgets/floating_line.dart';
import 'package:portfolio/presentation/home/widgets/hero_cta.dart';
import 'package:portfolio/presentation/home/widgets/scroll_indicator.dart';

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
  Offset _mousePosition = Offset.zero;

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

  void _onMouseMove(PointerEvent event) {
    setState(() {
      _mousePosition = Offset(
        (event.position.dx / MediaQuery.of(context).size.width - 0.5) * 20,
        (event.position.dy / MediaQuery.of(context).size.height - 0.5) * 20,
      );
    });
  }

  void _scrollToWork() {
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
    return MouseRegion(
      onHover: _onMouseMove,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: AppColorRoyal.heroGradient,
        ),
        child: Stack(
          children: [
            // Parallax floating lines
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

                        // Hero title with typewriter effect
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultTextStyle(
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
                                  child: AnimatedTextKit(
                                    animatedTexts: [
                                      TypewriterAnimatedText(
                                        StringC.heroTitle1,
                                        speed:
                                            const Duration(milliseconds: 80),
                                        cursor: '',
                                      ),
                                    ],
                                    totalRepeatCount: 1,
                                    pause: const Duration(milliseconds: 200),
                                    displayFullTextOnTap: true,
                                  ),
                                ),
                                ShaderMask(
                                  shaderCallback: (bounds) => AppColorRoyal
                                      .goldGradient
                                      .createShader(bounds),
                                  child: DefaultTextStyle(
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
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          StringC.heroTitle2,
                                          speed: const Duration(
                                              milliseconds: 80),
                                          cursor: '',
                                        ),
                                      ],
                                      totalRepeatCount: 1,
                                      pause: Duration.zero,
                                      displayFullTextOnTap: true,
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

                        // CTA button with magnetic effect
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                            child: MagneticWidget(
                              magneticDistance: 150,
                              magneticStrength: 0.2,
                              child: HeroCTA(onTap: _scrollToWork),
                            ),
                          ),
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
                child: const ScrollIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFloatingLines() {
    return List.generate(4, (index) {
      final parallaxFactor = 1.0 + (index * 0.15);
      return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        left: (10 + index * 20.0) % 90 + (_mousePosition.dx * parallaxFactor),
        top: (10 + index * 25.0) % 80 + (_mousePosition.dy * parallaxFactor),
        child: FloatingLine(
          delay: index * 0.5,
          height: 120 + (index * 30.0),
        ),
      );
    });
  }
}
