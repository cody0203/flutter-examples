import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../entities/engage_part.dart';
import '../widgets/engage_block.dart';
import '../widgets/engage_feature.dart';
import '../widgets/podcast_block.dart';
import '../widgets/podcast_linking.dart';

class EngageSection extends StatelessWidget {
  final List<EngagePart> _engages = engages;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 45, bottom: 60),
      color: Theme.of(context).accentColor,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          EngageFeature(),
          SizedBox(height: 114),
          for (var i = 0; i < _engages.length; i++)
            Container(
              margin: EdgeInsets.only(
                bottom: i != _engages.length ? 46 : 0,
              ),
              child: EngageBlock(
                engage: _engages[i],
              ),
            ),
          PodcastBlock(),
          SizedBox(height: 58),
          PodcastLinking(),
        ],
      ),
    );
  }
}
