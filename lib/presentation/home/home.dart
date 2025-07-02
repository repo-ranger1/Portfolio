import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/string_constants.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';
import 'package:portfolio/presentation/home/landing.dart';
import 'package:portfolio/presentation/home/widgets/header.dart';

import '../contact/contact.dart';
import '../work/work.dart';

class Modules {
  final Widget page;
  final String title;
  final GlobalKey key;

  const Modules({
    required this.key,
    required this.page,
    required this.title,
  });
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final ScrollController _scrollC;

  late final List<Modules> _modules;

  @override
  void initState() {
    _scrollC = ScrollController();

    // GlobalKeys for each section
    final GlobalKey meKey = GlobalKey();
    final GlobalKey workKey = GlobalKey();
    final GlobalKey profileKey = GlobalKey();
    final GlobalKey contactKey = GlobalKey();

    _modules = [
      Modules(
        key: meKey,
        title: StringC.me,
        page: Landing(key: meKey),
      ),
      Modules(
        key: workKey,
        title: StringC.work,
        page: Work(key: workKey),
      ),
      // Modules(
      //   key: profileKey,
      //   title: StringC.profile,
      //   page: SizedBox.shrink(key: profileKey),
      // ),
      Modules(
        key: contactKey,
        title: StringC.contact,
        page: Contact(key: contactKey),
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    _scrollC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollC,
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
