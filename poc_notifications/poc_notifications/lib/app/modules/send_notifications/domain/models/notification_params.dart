class NotificationParams {
  final String title;
  final String body;
  final String appId;
  final String token;

  const NotificationParams({
    required this.title,
    required this.body,
    required this.appId,
    required this.token,
  });
}

class NotificationParamsEmpty extends NotificationParams {
  const NotificationParamsEmpty() : super(title: '', body: '', appId: '', token: '');
}
