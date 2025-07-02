import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';

import '../../../core/constants/string_constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        StringC.craftedWithPassion,
        style: context.tt.titleLarge,
      ),
    );
  }
}
