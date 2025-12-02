import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/utils/responsive/responsive_utils.dart';

import '../../../core/constants/string_constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.spacing(24)),
      child: Text(
        StringC.craftedWithPassion,
        style: context.tt.titleLarge,
      ),
    );
  }
}
