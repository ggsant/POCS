import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum EventType {
  BUTTON_PRESSED,
}

extension EventTypeExtension on EventType {
  String get enumString => describeEnum(this);
}

class AppState extends InheritedWidget {
  final Amplitude analytics;
  final Widget child;

  AppState({
    Key key,
    @required this.child,
    @required this.analytics,
  }) : super(key: key, child: child);

  void log(String message) {
    print(message);
  }

  Future<void> logEvent(
    EventType eventType,
    String caller, {
    bool outOfSession,
    String message,
  }) async {
    await analytics.logEvent(
      eventType.enumString,
      eventProperties: {'page': caller},
      outOfSession: outOfSession,
    );

    String logMessage = '${eventType.enumString}:$caller';

    if (message != null) {
      logMessage += ': ';
      logMessage += message;
    }
    log(logMessage);
  }

  Future<void> uploadEvents() async {
    await analytics.uploadEvents();
    log('Upload Event');
  }

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return false;
  }

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppState>();
  }
}
