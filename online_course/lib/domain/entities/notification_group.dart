import 'package:online_course/domain/entities/notification.dart';

class NotificationGroup {
  final String date;
  final List<Notification> notifications;

  const NotificationGroup({
    required this.date,
    required this.notifications,
  });
}
