import 'package:portfolio/presentation/config/config_cubit.dart';

import 'core/utils/app/app_injector.dart';

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
///File Name: dependency_injector
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 08/05/25 16:33
class DependencyInjector {
  DependencyInjector.inject() {
    _injectRepositories();
    _injectBlocs();
  }

  /// Inject the source.
  void _injectRepositories() {}

  /// Inject the bloc.
  void _injectBlocs() {
    AppInjector.lazy<ConfigCubit>(() => ConfigCubit());
  }
}
