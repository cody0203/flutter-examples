import 'package:flutter/material.dart';
import 'package:instagram_feed/widgets/avatar.dart';

class StoryItem extends StatelessWidget {
  final String name;

  final Key key;
  final Widget avatarWidget;

  StoryItem({
    required this.name,
    required this.key,
    required this.avatarWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(
              top: 4,
              right: 4,
              bottom: 8,
              left: 4,
            ),
            child: avatarWidget,
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
