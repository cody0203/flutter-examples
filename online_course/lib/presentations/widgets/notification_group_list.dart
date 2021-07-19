import 'package:flutter/material.dart';
import 'package:online_course/presentations/widgets/notification_item.dart';

import '../../data/notifications.dart';
import '../../domain/entities/notification_group.dart';

class NotificationGroupList extends StatelessWidget {
  final List<NotificationGroup> _notificationGroups = notificationGroups;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var ng in _notificationGroups)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  ng.date,
                  style: Theme.of(context).textTheme.bodyText1!.merge(
                        TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                ),
                SizedBox(height: 19),
                for (var notification in ng.notifications)
                  NotificationItem(
                    notification: notification,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
