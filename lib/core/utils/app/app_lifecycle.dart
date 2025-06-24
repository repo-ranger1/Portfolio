import 'package:flutter/material.dart';

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
///File Name: app_lifecycle
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 09/05/25 11:35

/// [LifeCycleManager] listen to the states of the application
/// and perform certain operation on certain states.
/// state are [Pause], [Resume], [Detached] and [Inactive].

class LifeCycleManager extends StatefulWidget {
  const LifeCycleManager({super.key, required this.child});

  final Widget child;

  @override
  State<LifeCycleManager> createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    try {
      /*if (state == AppLifecycleState.resumed &&
          AppSingleton().isAuthenticated == null &&
          (SharedPrefSingleton().getValue(key: KeyConsts.bioChoice) ?? false)) {
        _doTheAuthentication();
      }*/
      switch (state) {
        // If app is in paused state.
        case AppLifecycleState.paused:
          debugPrint("App paused");

        // If app is in resumed state.
        case AppLifecycleState.resumed:
          debugPrint("App Resumed");

        // final bool biometricOn =
        //     SharedPrefSingleton().getValue(key: KeyConsts.bioChoice) ?? false;

        // final bool isNotAuth = !(AppSingleton().isAuthenticated ?? true);

        // If user opted for authentication and
        // authentication is not done yet
        // than do the authentication.
        // if (biometricOn && isNotAuth) {
        //   PerformAppAuthentication.authenticate();
        // }

        // If app is in detached state.
        case AppLifecycleState.detached:
          debugPrint("App detached");

        // If app is inactive state.
        case AppLifecycleState.inactive:
          // AppSingleton().isAuthenticated = false;
          debugPrint("App inactive");
        default:
          break;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }
}
