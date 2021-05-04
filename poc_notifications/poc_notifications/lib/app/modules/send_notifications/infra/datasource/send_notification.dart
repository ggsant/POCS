import '../../domain/entities/notification_result.dart';
import '../../domain/models/notification_params.dart';

abstract class SendNotificationDataSouce {
  Future<NotificationResult> sendNotifications(NotificationParams params);
}
