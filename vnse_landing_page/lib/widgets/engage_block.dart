import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../entities/engage_part.dart';
import 'engage_block_feature.dart';
import 'engage_block_more_content.dart';

class EngageBlock extends StatelessWidget {
  final EngagePart engage;

  const EngageBlock({
    required this.engage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: DottedBorder(
        color: Theme.of(context).errorColor,
        strokeWidth: 1,
        dashPattern: [8, 5, 2, 3],
        borderType: BorderType.RRect,
        radius: const Radius.circular(16),
        padding: const EdgeInsets.only(
          top: 14,
          right: 15,
          bottom: 24,
          left: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                engage.title,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(height: 18),
            EngageBlockFeature(
              feature: engage.feature,
            ),
            SizedBox(height: 24),
            EngageBlockMoreContent(
              title: engage.subTitle,
              data: engage.engages,
            ),
          ],
        ),
      ),
    );
  }
}
