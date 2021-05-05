import 'package:hive/hive.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/notification_result.dart';

part 'notification_adapter.g.dart';

@HiveType(typeId: 1)
class NotificationResultHive extends NotificationResult {
  @HiveField(0)
  final String message;
  NotificationResultHive(this.message) : super(message);
}
