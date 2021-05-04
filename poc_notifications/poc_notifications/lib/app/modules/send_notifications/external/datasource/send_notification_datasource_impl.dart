import 'package:dio/dio.dart';
import '../../domain/entities/notification_result.dart';
import '../../domain/errors/notifications_failures/notifications_failures.dart';
import '../../infra/datasource/send_notification.dart';

class SendNotificationDataSouceImpl implements SendNotificationDataSouce {
  final Dio client;

  const SendNotificationDataSouceImpl(this.client);

  @override
  Future<NotificationResult> sendNotifications(params) async {
    var response = await client.post(
      'https://onesignal.com/api/v1/notifications',
      data: {
        "app_id": params.appId,
        "included_segments": ["Subscribed Users"],
        "headings": {"en": params.title},
        "contents": {"en": params.body}
      },
      options: Options(
        headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Basic ${params.token}"
        },
      ),
    );

    if (response.statusCode == 200) {
      return const NotificationResult('Ok!');
    } else {
      throw const DataSourceNotificationFailure(
        'Ocorreu um erro no datasource',
      );
    }
  }
}
