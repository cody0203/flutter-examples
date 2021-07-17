import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../entities/podcast.dart';
import 'podcast_item.dart';

class PodcastBlock extends StatelessWidget {
  final List<Podcast> _podcasts = podcasts;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 104),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Text(
            'Vietsibility Podcasts',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 36),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (var pc in _podcasts)
                  PodcastItem(
                    thumbnail: pc.thumbnail,
                    title: pc.title,
                    description: pc.description,
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
