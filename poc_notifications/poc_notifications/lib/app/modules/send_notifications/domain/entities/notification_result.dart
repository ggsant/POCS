class NotificationResult {
  final String message;

  const NotificationResult(this.message);
}

class NotificationResultEmpty extends NotificationResult {
  const NotificationResultEmpty() : super('');
}
