import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import './avatar.dart';

class MyStoryAvatar extends StatelessWidget {
  final String avatar;
  final bool isSeen;

  MyStoryAvatar({
    required this.avatar,
    required this.isSeen,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Avatar(
          avatar: avatar,
          isSeen: isSeen,
        ),
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: const Color(
                  0xff3e95f6,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: const Icon(
                FeatherIcons.plus,
                color: Colors.white,
                size: 14,
              ),
            ),
          ),
        )
      ],
    );
  }
}
