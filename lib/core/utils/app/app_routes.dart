import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';

import '../../../presentation/home/home.dart';

///Meditab Software Inc. CONFIDENTIAL
///__________________
///
/// [2025] Meditab Software Inc.
/// All Rights Reserved.
///
///NOTICE:  All information contained herein is, and remains
///the property of Meditab Software Inc. and its suppliers,
///if any.  The intellectual and technical concepts contained
///herein are proprietary to Meditab Software Incorporated
///and its suppliers and may be covered by U.S. and Foreign Patents,
///patents in process, and are protected by trade secret or copyright law.
///Dissemination of this information or reproduction of this material
///is strictly forbidden unless prior written permission is obtained
///from Meditab Software Incorporated.
///
///File Name: app_routes
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 13/05/25 14:35

/// The Page transition animation enum.
enum PageTransitionAnimation { slide, fade, normal }

class AppRoutes {
  /// post login screen route.
  static const String postLogin = '/postLogin';

  /// login page route.
  static const String login = '/login';

  /// settings page route.
  static const String settings = '/settings';

  /// home page route
  static const String home = '/home';

  /// Capture operation images page.
  static const String captureOpImage = '/captureOpImages';
}

/// The RouteGenerator class is responsible for generating routes based on the
/// given route settings and animations defined in [transition].
class AppRouteGenerator {
  /// The PageTransition animation to be used for route transitions.
  static PageTransitionAnimation transition = PageTransitionAnimation.normal;

  /// Generates a route based on the given [RouteSettings].
  /// Returns a [Route] object representing the destination page.
  static Route generate(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      // Home screen route.
      case AppRoutes.home:
        page = const Home();
        break;

      default:
        page = const Text('Invalid Path').center;
        break;
    }

    // To animate the page transition, based on the chosen [transition].
    switch (transition) {
      // Fade animation.
      case PageTransitionAnimation.fade:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, anim, secondaryAnim, child) {
            return FadeTransition(opacity: anim, child: child);
          },
        );

      // Slide animation.
      case PageTransitionAnimation.slide:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // The tween object to define slide animation from right to left.
            final Animatable<Offset> routeAnimation = Tween(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).chain(CurveTween(curve: Curves.ease));

            return SlideTransition(
              position: animation.drive(routeAnimation),
              child: child,
            );
          },
        );

      // Default case, use a MaterialPageRoute for the transition.
      default:
        return MaterialPageRoute(builder: (context) => page);
    }
  }
}
