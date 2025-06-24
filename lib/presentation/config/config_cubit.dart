import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/storage/local_storage/local_storage.dart';

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
///File Name: landing_cubit
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 09/05/25 11:26

sealed class ConfigState {}

class InitialS extends ConfigState {}

class ToggleThemeS extends ConfigState {}

class ConfiguredS extends ConfigState {}

/// [ConfigCubit] performs operations needed to done before launching the app.
/// That includes initializing [DeviceInfoSingletonMD], [NetworkHandler],
/// [AppTheme] and [PostLogin].
class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(InitialS());

  /// [toggleTheme] will change the theme dark to light and light to dart.
  void toggleTheme() {
    LocalStorage().isDarkTheme.v = !(LocalStorage().isDarkTheme.v ?? false);
    emit(ToggleThemeS());
  }

  /// [setup] performs operations needed to done before launching the app.
  /// That includes initializing [DeviceInfoSingletonMD], [NetworkHandler],
  /// [AppTheme] and [PostLogin].
  Future<void> setup() async {
    // Retrieve the Current application version
    // and saving it in the App singleton.
    // final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // AppSession().appVersion = packageInfo.version.toString();

    emit(ConfiguredS());
  }
}
