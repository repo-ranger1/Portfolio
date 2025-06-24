import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
///File Name: launcher_util
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 09/05/25 13:54

/// [LauncherUtils] is responsible for lunching dial-pad
/// when user click a phone no.
///
class LauncherUtils {
  /// this method is used to open caller screen
  static void launchDialPad(String phoneNumber) async {
    String url = "tel:$phoneNumber";
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      await Future.error('Could not launch dial pad with $url');
    }
  }

  /// Launch Email with a query according subject and body.
  static Future<void> launchEmail({
    final String? scheme,
    required final String email,
    final Map<String, String>? query,
  }) async {
    final Uri emailLaunchUri = Uri(
      query: encodeQueryParameters(query ?? {}),
      scheme: scheme ?? 'mailto',
      path: email,
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      await Future.error('Could not launch email.');
    }
  }

  static Future<void> launchMap({
    required final String address,
    required final BuildContext context,
  }) async {
    late final Uri uri;
    if (Platform.isAndroid) {
      uri = Uri.parse("https://maps.google.com/?q=$address");
    } else {
      uri = Uri.parse("http://maps.apple.com/?q=$address");
    }

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      await Future.error('Could not launch map with $address');
    }
  }

  static Future<void> launchLink({
    required final String link,
  }) async {
    final Uri uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      await Future.error('Could not launch $link');
    }
  }

  // static Future<void> launchPlayAppStore() async {
  //   final url = Uri.parse(
  //     Platform.isAndroid
  //         ? "market://details?id=${AppConsts.playStoreId}"
  //         : "https://apps.apple.com/app/id${AppConsts.appStoreId}",
  //   );
  //   await launchUrl(url, mode: LaunchMode.externalApplication);
  // }

  static String? encodeQueryParameters(Map<String, String> params) => params
      .entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
