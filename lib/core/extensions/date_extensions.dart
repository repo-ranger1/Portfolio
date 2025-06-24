import 'package:intl/intl.dart';

import '../constants/string_constants.dart';

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
///File Name: date_extensions.dart
///
///@author Niyati Patel (niyatip@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 02/06/25 2:32 pm
///

extension DateExtensions on String {
  String convertDateToString() {
    try {
      return DateFormat(StringC.dateFormat).format(DateTime.parse(this));
    } catch (e) {
      return '';
    }
  }
}
