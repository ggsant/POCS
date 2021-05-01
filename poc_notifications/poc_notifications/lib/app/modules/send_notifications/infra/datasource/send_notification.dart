import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/models/notification_params.dart';

abstract class SendNotificationDataSouce {
  Future<NotificationResult> sendNotifications(NotificationParams params);
}
