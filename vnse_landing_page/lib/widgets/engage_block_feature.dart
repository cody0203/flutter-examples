import 'package:flutter/material.dart';

import '../entities/engage.dart';

class EngageBlockFeature extends StatelessWidget {
  final Engage feature;

  const EngageBlockFeature({
    required this.feature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(feature.thumbnail),
          SizedBox(height: 17),
          Text(
            feature.title,
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 5),
          Text(
            feature.publishedAt,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
