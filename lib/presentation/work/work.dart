import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/asset_constants.dart';
import 'package:portfolio/presentation/work/widgets/project_page.dart';

import '../../core/constants/string_constants.dart';

enum ProjectsEnum {
  masterPieceStudio(
    textColor: Colors.white,
    color: Color(0xFF0D47A1),
    name: StringC.masterpieceStudio,
    image: AssetC.masterpieceStudio,
    subtitle: StringC.masterpieceStudioSubtitle,
  ),
  dosesDelivery(
    textColor: Colors.black,
    color: Color(0xFF81D4FA),
    name: StringC.dosePackDelivery,
    image: AssetC.dosePackDelivery,
    subtitle: StringC.dosePackDeliverySubtitle,
  ),
  myDoses(
    name: StringC.myDoses,
    image: AssetC.myDoses,
    textColor: Colors.white,
    color: Color(0xFF4527A0),
    subtitle: StringC.myDosesSubtitle,
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

class Work extends StatelessWidget {
  const Work({super.key});

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
