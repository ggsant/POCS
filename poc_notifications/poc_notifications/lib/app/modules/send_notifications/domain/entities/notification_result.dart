class NotificationResult {
  final String message;

  const NotificationResult(this.message);

  factory NotificationResult.empty() => const NotificationResult('');
}
