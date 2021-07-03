import 'package:flutter/material.dart';

import './widgets/story_bar.dart';
import './widgets/article_list.dart';

class InstagramFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double appBarHeight =
        MediaQuery.of(context).padding.top - kToolbarHeight;

    return Container(
      height: MediaQuery.of(context).size.height - appBarHeight,
      width: double.infinity,
      child: ListView(
        children: <Widget>[
          StoryBar(),
          ArticleList(),
        ],
      ),
    );
  }
}
