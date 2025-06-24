import '../../../constants/key_constants.dart';
import 'local_storage_abs.dart';

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
///File Name: local_storage
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 08/05/25 18:32

class LocalStorage {
  LocalStorage._();

  static final LocalStorage _instance = LocalStorage._();

  factory LocalStorage() => _instance;

  late final LocalStorageSync _ls;

  Future<void> init() async {
    _ls = LocalStorageSync();
    await _ls.init();
    isDarkTheme = LocalValue(ls: _ls, key: KeyC.theme);
  }

  late LocalValue<bool> isDarkTheme;

  // Removes all the values from the local storage.
  Future<void> get clearAll => _ls.clearAll();
}
