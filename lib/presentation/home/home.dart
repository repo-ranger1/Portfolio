import 'package:flutter/material.dart';
import 'package:portfolio/common/widgets/hover_underline_text.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';
import 'package:portfolio/presentation/home/page1.dart';
import 'package:portfolio/presentation/home/widgets/about_me.dart';
import 'package:portfolio/presentation/home/widgets/projects.dart';

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
        title: 'Me',
        key: meKey,
        page: Page1(key: meKey),
      ),
      Modules(
        title: 'Work',
        key: workKey,
        page: Projects(key: workKey),
      ),
      Modules(
        title: 'Profile',
        key: profileKey,
        page: SizedBox.shrink(key: profileKey),
      ),
      Modules(
        title: 'Contact',
        key: contactKey,
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

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.modules,
  });

  final List<Modules> modules;

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
