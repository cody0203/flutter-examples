import '../domain/entities/notification.dart';
import '../domain/entities/notification_group.dart';

List<NotificationGroup> notificationGroups = [
  NotificationGroup(
    date: '14 Jan, 2021',
    notifications: [
      Notification(
        title: 'Online certificate is release.',
        description:
            'Thank you for working on the problem to the end, hopefully it\'s useful',
        isRead: false,
      ),
      Notification(
        title: 'Remember the courses',
        description:
            'We remind you to complete the tasks that have not been done, the spirit of good luck',
        isRead: true,
      ),
    ],
  ),
  NotificationGroup(
    date: '02 Jan, 2021',
    notifications: [
      Notification(
        title: 'Online certificate is release.',
        description:
            'Thank you for working on the problem to the end, hopefully it\'s useful',
        isRead: true,
      ),
    ],
  ),
];
