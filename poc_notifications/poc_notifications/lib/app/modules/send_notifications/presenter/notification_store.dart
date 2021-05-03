import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/notifications_failures/notifications_failures.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/models/notification_params.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/usecase/send_notification_usecase.dart';

class NotificationStore extends NotifierStore<NotificationsFailures, NotificationResult> {
  final SendNotificationUseCase sendNotificationsUsecase;
  final String appId = '4b743770-c3fb-4e15-9ab2-e3052aa64e46';
  final String token = 'batata';

  NotificationStore(this.sendNotificationsUsecase) : super(NotificationResultEmpty());

  void sendNotifications(String title, String body) {
    executeEither(
      () => sendNotificationsUsecase(
        NotificationParams(
          body: body,
          title: title,
          appId: appId,
          token: token,
        ),
      ),
    );
  }
}
