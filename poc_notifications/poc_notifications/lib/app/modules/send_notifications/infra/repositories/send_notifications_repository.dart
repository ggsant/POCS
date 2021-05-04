import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/models/notification_params.dart';
import '../../domain/errors/notifications_failures/notifications_failures.dart';
import '../../domain/entities/notification_result.dart';
import '../../domain/repositories/send_notification_repository.dart';
import '../datasource/send_notification.dart';

class SendNotificationRepositoryImpl implements SendNotificationRepository {
  final SendNotificationDataSouce dataSouce;

  const SendNotificationRepositoryImpl(this.dataSouce);

  @override
  Future<Either<NotificationsFailures, NotificationResult>> sendNotifications(
      NotificationParams params) async {
    try {
      final notifications = await dataSouce.sendNotifications(params);
      return Right(notifications);
    } on DioError catch (e) {
      return Left(DataSourceNotificationFailure(e.message));
    } on NotificationsFailures catch (e) {
      return Left(e);
    }
  }
}
