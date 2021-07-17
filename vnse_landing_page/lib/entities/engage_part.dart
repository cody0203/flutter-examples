import 'package:vnse_landing_page/entities/engage.dart';

class EngagePart {
  final String title;
  final String subTitle;
  final Engage feature;
  final List<Engage> engages;

  const EngagePart({
    required this.title,
    required this.feature,
    required this.subTitle,
    required this.engages,
  });
}
