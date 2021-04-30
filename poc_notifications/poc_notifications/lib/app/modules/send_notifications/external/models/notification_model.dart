import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';

class NotificationModel extends NotificationResult {
  NotificationModel(String message) : super(message);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
