abstract class NotificationsFailures {
  final String message;

  const NotificationsFailures(this.message);

  @override
  String toString() {
    return "$runtimeType: $message";
  }
}

class ValidationFailure extends NotificationsFailures {
  const ValidationFailure(String message) : super(message);
}

class DataSourceFailure extends NotificationsFailures {
  const DataSourceFailure(String message) : super(message);
}

class UnknownFailure extends NotificationsFailures {
  const UnknownFailure(String message) : super(message);
}
