import 'package:dio/dio.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/external/models/notification_model.dart';
import 'package:poc_notifications/app/modules/send_notifications/infra/datasource/send_notification.dart';

class SendNotificationDataSouceImpl implements SendNotificationDataSouce {
  @override
  Future<NotificationResult> sendNotifications() async {
    var response = await Dio().get('');
    return NotificationModel.fromJson(response.data);
  }
}
