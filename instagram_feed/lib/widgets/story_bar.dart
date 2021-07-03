import 'package:flutter/material.dart';
import 'package:instagram_feed/models/story.dart';
import './my_story_avatar.dart';
import './story_item.dart';
import 'package:instagram_feed/widgets/avatar.dart';

class StoryBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xff131313),
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 1.0,
            color: Color.fromRGBO(54, 54, 54, 1.0),
          ),
        ),
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          StoryItem(
            name: 'Your Story',
            key: new Key('0'),
            avatarWidget: MyStoryAvatar(
              avatar: 'assets/images/my_avatar.jpeg',
              isSeen: true,
            ),
          ),
          for (var item in storyList)
            StoryItem(
              key: ValueKey(item.id),
              name: item.name,
              avatarWidget: Avatar(
                avatar: item.avatar,
                isSeen: item.isSeen,
              ),
            )
        ],
      ),
    );
  }
}
