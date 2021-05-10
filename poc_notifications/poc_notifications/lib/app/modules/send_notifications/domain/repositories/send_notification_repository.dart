import 'package:dartz/dartz.dart';
import '../entities/notification_result.dart';
import '../errors/notifications_failures/notifications_failures.dart';
import '../models/notification_params.dart';

abstract class SendNotificationRepository {
  Future<Either<NotificationsFailures, NotificationResult>> sendNotifications(NotificationParams params);
}
