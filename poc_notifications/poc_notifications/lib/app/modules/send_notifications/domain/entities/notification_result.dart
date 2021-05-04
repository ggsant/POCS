import 'package:hive/hive.dart';

part 'notification_result.g.dart';

@HiveType(typeId: 1)
class NotificationResult {
  @HiveField(0)
  final String message;

  const NotificationResult(this.message);
}

class NotificationResultEmpty extends NotificationResult {
  const NotificationResultEmpty() : super('');
}
