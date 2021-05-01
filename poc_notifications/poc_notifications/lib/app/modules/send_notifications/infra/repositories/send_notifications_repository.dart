import 'package:dio/dio.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/models/notification_params.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/notifications_failures/notifications_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:dartz/dartz.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/repositories/send_notification_repository.dart';
import 'package:poc_notifications/app/modules/send_notifications/infra/datasource/send_notification.dart';

class SendNotificationRepositoryImpl implements SendNotificationRepository {
  final SendNotificationDataSouce dataSouce;

  SendNotificationRepositoryImpl(this.dataSouce);

  @override
  Future<Either<NotificationsFailures, NotificationResult>> sendNotifications(NotificationParams params) async {
    try {
      final notifications = await dataSouce.sendNotifications(params);
      return Right(notifications);
    } on DioError catch (e) {
      return Left(DataSourceFailure(e.message));
    } on NotificationsFailures catch (e) {
      return Left(e);
    }
  }
}
