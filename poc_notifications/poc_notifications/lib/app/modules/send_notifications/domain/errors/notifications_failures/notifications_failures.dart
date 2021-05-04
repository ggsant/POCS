abstract class NotificationsFailures {
  final String message;

  const NotificationsFailures(this.message);

  @override
  String toString() {
    return "$runtimeType: $message";
  }
}

class ValidationNotificationFailure extends NotificationsFailures {
  const ValidationNotificationFailure(String message) : super(message);
}

class DataSourceNotificationFailure extends NotificationsFailures {
  const DataSourceNotificationFailure(String message) : super(message);
}
