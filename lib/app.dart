import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/utils/device/device_config.dart';
import 'package:portfolio/presentation/config/config.dart';
import 'package:portfolio/presentation/config/config_cubit.dart';
import 'package:portfolio/presentation/home/home.dart';

import 'common/widgets/cursor_follower.dart';
import 'core/utils/app/app_injector.dart';
import 'core/utils/app/app_lifecycle.dart';
import 'core/utils/app/app_routes.dart';
import 'core/utils/app/app_theme.dart';
import 'core/utils/storage/local_storage/local_storage.dart';
import 'main.dart';

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
///File Name: app
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 09/05/25 11:21

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// [ConfigCubit] performs operations needed to done before launching the appa
  /// That includes initializing [DeviceInfoSingletonMD], [NetworkHandler],
  /// [AppTheme] and [PostLogin].
  late final ConfigCubit _cubit;

  /// To store the theme selected by the user in the previous session.
  late ThemeData themeData;

  /// To store the initial widget tree for the app.
  late Widget child;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _cubit = AppInjector.get<ConfigCubit>();
    _cubit.setup();

    themeData = AppTheme.light;
    child = const ConfigPage();
  }

  @override
  Widget build(BuildContext context) {
    // Taking device screen height and width
    // will be stored in app consts and used every where.
    // will set the orientation according to the device type
    // landscape if tablet and portrait if mobile.
    Device().init(context);

    // Setting Color and icon Color of the
    // navigator bar and status bar of the device.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    // To monitor when app goes to paused and resume state.
    // used to do the the local authentication.
    return LifeCycleManager(
      // Used bloc provider to change to theme between light and dark from anywhere.
      child: BlocProvider(
        create: (context) => _cubit,
        child: BlocBuilder(
          bloc: _cubit,
          builder: (context, state) {
            if (state is ConfiguredS || state is ToggleThemeS) {
              child = const Home();
              // state.isRouteToHomeScreen
              //     ? const Home()
              //     : const LoginScreen();
              themeData = LocalStorage().isDarkTheme.v ?? false
                  ? AppTheme.dark
                  : AppTheme.light;
            }
            return MaterialApp(
              theme: themeData,
              navigatorKey: globalNavKey,
              debugShowCheckedModeBanner: false,
              home: CursorFollower(child: child),
              onGenerateRoute: AppRouteGenerator.generate,
            );
          },
        ),
      ),
    );
  }
}
