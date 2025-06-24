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
///File Name: string_exntesion
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 08/05/25 16:18
extension NullStringExt on String? {
  bool get isNotNullOrEmpty => this != null && (this?.isNotEmpty ?? false);

  /// [capFirstLetter] Capitalize the
  /// First letter of the word
  /// of given sentence.
  String get capFirstLetter {
    if (isNotNullOrEmpty) {
      return "${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}";
    } else {
      return this ?? '';
    }
  }

  /// [capFirstLetter] Capitalize the
  /// First letter letter of every word
  /// of given sentence.
  String get capEveryFirstLetter =>
      this?.split(' ').map((word) => word.capFirstLetter).join(' ') ?? '';
}
