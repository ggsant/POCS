import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';

abstract class SendNotificationDataSouce {
  Future<NotificationResult> sendNotifications();
}
