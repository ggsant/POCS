class NotificationParams {
  final String title;
  final String body;

  const NotificationParams({required this.title, required this.body});

  NotificationParams copyWith({
    String? title,
    String? body,
  }) {
    return NotificationParams(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}

class NotificationParamsEmpty extends NotificationParams {
  const NotificationParamsEmpty() : super(title: '', body: '');
}
