import 'package:flutter/material.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';

import '../../../common/widgets/hover_underline_text.dart';
import '../../../core/utils/app/app_fonts.dart';
import '../../../domain/entities/module_entity.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.modules,
  });

  final List<ModuleEntity> modules;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            child: Text(
              'GM',
              style: context.tt.titleSmall?.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontFamily: AppFonts.boska,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            spacing: 60,
            children: List.generate(
              modules.length,
              (i) => GestureDetector(
                onTap: () => _onModuleChange(i),
                child: HoverUnderlineText(
                  modules[i].title,
                  style: context.tt.titleLarge,
                ),
              ),
            ).toList(),
          )
        ],
      ),
    );
  }

  void _onModuleChange(int newModule) {
    final BuildContext? keyContext = modules[newModule].key.currentContext;

    if (keyContext == null) return;

    Scrollable.ensureVisible(
      keyContext,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
    );
  }
}
