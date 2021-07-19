import 'package:flutter/material.dart';
import 'package:online_course/domain/entities/notification.dart' as Noti;

class NotificationItem extends StatelessWidget {
  final Noti.Notification notification;

  const NotificationItem({
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 18,
        right: 32,
        bottom: 21,
        left: 14,
      ),
      decoration: BoxDecoration(
        color: Color(0xffFCFCFC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            notification.title,
            style: Theme.of(context).textTheme.headline3!.merge(
                  TextStyle(
                      color: notification.isRead
                          ? Color.fromRGBO(
                              18,
                              18,
                              18,
                              0.3,
                            )
                          : Colors.black),
                ),
          ),
          SizedBox(height: 12),
          Text(
            notification.description,
            style: Theme.of(context).textTheme.bodyText1!.merge(
                  TextStyle(
                    color: notification.isRead
                        ? Color.fromRGBO(
                            18,
                            18,
                            18,
                            0.3,
                          )
                        : Theme.of(context).textTheme.bodyText1?.color,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
