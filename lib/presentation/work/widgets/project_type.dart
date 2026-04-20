import 'package:portfolio/core/constants/asset_constants.dart';
import 'package:portfolio/core/constants/string_constants.dart';

/// Returns the projects to display for the current build variant,
/// in the order defined by [StringC.projectKeys].
List<ProjectType> get variantProjects {
  final keys = StringC.projectKeys;
  final all = {for (final p in ProjectType.values) p.name: p};
  final numbered = <ProjectType>[];
  for (var i = 0; i < keys.length; i++) {
    final project = all[keys[i]];
    if (project != null) numbered.add(project);
  }
  return numbered;
}

enum ProjectType {
  imsGo(
    number: '01',
    category: StringC.imsGoCategory,
    title: StringC.imsGo,
    description: StringC.imsGoSubtitle,
    image: AssetC.imsgo,
    playStoreUrl: StringC.imsGoPlayStoreUrl,
    appStoreUrl: StringC.imsGoAppStoreUrl,
  ),
  imsCare(
    number: '02',
    category: StringC.imsCareCategory,
    title: StringC.imsCare,
    description: StringC.imsCareSubtitle,
    image: AssetC.imscare,
    playStoreUrl: StringC.imsCarePlayStoreUrl,
    appStoreUrl: StringC.imsCareAppStoreUrl,
  ),
  mydoses(
    number: '03',
    category: StringC.myDosesCategory,
    title: StringC.myDoses,
    description: StringC.myDosesSubtitle,
    image: AssetC.myDoses,
    playStoreUrl: StringC.myDosesPlayStoreUrl,
    appStoreUrl: StringC.myDosesAppStoreUrl,
  ),
  dosePack(
    number: '04',
    category: StringC.dosePackDeliveryCategory,
    title: StringC.dosePackDelivery,
    description: StringC.dosePackDeliverySubtitle,
    image: AssetC.dosePackDelivery,
    playStoreUrl: StringC.dosePackDeliveryPlayStoreUrl,
    appStoreUrl: StringC.dosePackDeliveryAppStoreUrl,
  ),
  masterpiece(
    number: '05',
    category: StringC.masterpieceStudioCategory,
    title: StringC.masterpieceStudio,
    description: StringC.masterpieceStudioSubtitle,
    image: AssetC.masterpieceStudio,
  ),
  // cataractAI(
  //   number: '04',
  //   category: StringC.cataractAICategory,
  //   title: StringC.cataractAI,
  //   description: StringC.cataractAISubtitle,
  //   image: AssetC.cataractAI,
  //   playStoreUrl: StringC.cataractAIPlayStoreUrl,
  //   appStoreUrl: StringC.cataractAIAppStoreUrl,
  // ),
  // showItMax(
  //   number: '05',
  //   category: StringC.showItMaxCategory,
  //   title: StringC.showItMax,
  //   description: StringC.showItMaxSubtitle,
  //   image: AssetC.showItMax,
  //   playStoreUrl: StringC.showItMaxPlayStoreUrl,
  //   appStoreUrl: StringC.showItMaxAppStoreUrl,
  // )
  ;

  final String number;
  final String category;
  final String title;
  final String description;
  final String image;
  final String? playStoreUrl;
  final String? appStoreUrl;

  const ProjectType({
    required this.number,
    required this.category,
    required this.title,
    required this.description,
    required this.image,
    this.playStoreUrl,
    this.appStoreUrl,
  });
}
