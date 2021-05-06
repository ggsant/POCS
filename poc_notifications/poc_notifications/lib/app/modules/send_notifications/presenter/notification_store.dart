import 'package:flutter_triple/flutter_triple.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../domain/entities/credentials_result.dart';
import '../domain/entities/notification_result.dart';
import '../domain/errors/notifications_failures/notifications_failures.dart';
import '../domain/models/notification_params.dart';
import '../domain/usecase/send_notification_usecase.dart';

import '../../../../api_one_signal.dart';

class NotificationStore extends NotifierStore<NotificationsFailures, NotificationResult> {
  final SendNotificationUseCase sendNotificationsUsecase;

  NotificationStore(this.sendNotificationsUsecase) : super(NotificationResult.empty());

  void sendNotifications(String title, String body, CredentialResult credential) {
    executeEither(
      () => sendNotificationsUsecase(
        NotificationParams(
          body: body,
          title: title,
          appId: credential.appId,
          token: credential.token,
        ),
      ),
    );
  }

  void initOneSignal() async {
    await OneSignal.shared.setAppId(appId);
  }
}
