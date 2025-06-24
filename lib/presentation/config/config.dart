import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';

import '../../common/widgets/cyclic_text.dart';
import '../../core/constants/asset_constants.dart';

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
///File Name: config
///
///@author Gautam Manvani (gautamm@meditab.com) Meditab Software Inc.
///@version 1.0.0
///@since 13/05/25 15:11
class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AssetC.configAnimation,
          ),
          CyclingTextWidget(
            messages: const [''],
            pauseTime: const Duration(seconds: 5),
            textStyle: context.tt.titleMedium?.copyWith(),
          ),
        ],
      ).parentWidth,
    );
  }
}
