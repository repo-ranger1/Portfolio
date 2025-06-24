import 'package:flutter/material.dart';
import 'package:portfolio/common/widgets/hover_underline_text.dart';
import 'package:portfolio/core/constants/asset_constants.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/core/extensions/widget_extensions.dart';

import '../../../core/utils/device/device_config.dart';

enum ProjectsEnum {
  masterPieceStudio(
    textColor: Colors.white,
    color: Color(0xFF0D47A1),
    name: 'MasterPiece\nStudio',
    image: AssetC.masterpieceStudio,
    subtitle:
        "A visual journey through world-class art, right from your fingertips.\nIt’s making fine art feel personal, accessible, and maybe even addictive.",
  ),
  dosesDelivery(
    textColor: Colors.black,
    color: Color(0xFF81D4FA),
    name: 'DosePack\nDelivery',
    image: AssetC.dosePackDelivery,
    subtitle:
        "Built for real-time logistics — maps, navigation, and status updates that don’t miss a beat.\nIt’s changing how essential meds reach homes, one seamless delivery at a time.",
  ),
  myDoses(
    name: 'MyDoses',
    image: AssetC.myDoses,
    textColor: Colors.white,
    color: Color(0xFF4527A0),
    subtitle:
        "Smart medication tracking that just works — even when your phone doesn’t.\nIt’s helping people stay on schedule, stay safe, and stay independent.",
  );
  // imsCare(
  //   name: 'IMS Care',
  //   image: AssetC.mockup,
  //   color: Color(0xFFE1BEE7),
  //   subtitle: '',
  // );

  final String name;
  final Color color;
  final String image;
  final Color textColor;
  final String subtitle;

  const ProjectsEnum({
    required this.image,
    required this.name,
    required this.color,
    required this.subtitle,
    required this.textColor,
  });
}

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: ProjectsEnum.values.length,
      itemBuilder: (context, i) => Project(
        project: ProjectsEnum.values[i],
      ),
    );
  }
}

class Project extends StatelessWidget {
  const Project({
    super.key,
    required this.project,
  });

  final ProjectsEnum project;

  @override
  Widget build(BuildContext context) {
    final Widget image = Image.asset(
      project.image,
      fit: BoxFit.cover,
      width: Device().width,
      height: Device().height,
    ).expand(flex: 4);

    return SizedBox(
      width: Device().width,
      height: Device().height,
      child: Row(
        children: [
          if (project.index % 2 == 0) image,
          Scaffold(
            backgroundColor: project.color,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100,
                horizontal: 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HoverUnderlineText(
                    project.name,
                    style: context.tt.titleSmall?.copyWith(
                      fontSize: 40,
                      color: project.textColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    project.subtitle,
                    style: context.tt.titleLarge?.copyWith(
                      fontSize: 20,
                      color: project.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ).expand(flex: 2),
          if (project.index % 2 != 0) image,
        ],
      ),
    );
  }
}
