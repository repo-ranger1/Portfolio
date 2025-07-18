import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';
import 'package:portfolio/presentation/home/landing.dart';
import 'package:portfolio/presentation/home/widgets/header.dart';

import '../../domain/entities/module_entity.dart';
import '../contact/contact.dart';
import '../profile/profile.dart';
import '../work/work.dart';

// GlobalKeys for identifying individual modules.
final GlobalKey meKey = GlobalKey();
final GlobalKey workKey = GlobalKey();
final GlobalKey profileKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

/// [Home] — The main persistent page of the website.
/// Displays all modules in a single scrollable list,
/// with a fixed header at the top.
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Collection of all available modules displayed on the website.
  late final List<ModuleEntity> _modules;

  @override
  void initState() {
    // Populating the module.
    _modules = [
      ModuleEntity(
        key: meKey,
        title: StringC.me,
        page: Landing(key: meKey),
      ),
      ModuleEntity(
        key: workKey,
        title: StringC.work,
        page: Work(key: workKey),
      ),
      ModuleEntity(
        key: profileKey,
        title: StringC.profile,
        page: Profile(key: profileKey),
      ),
      ModuleEntity(
        key: contactKey,
        title: StringC.contact,
        page: Contact(key: contactKey),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: List.generate(
                _modules.length,
                (i) => _modules[i].page,
              ).toList(),
            ).parentWidth,
          ),
          Header(modules: _modules),
        ],
      ),
    );
  }
}
