import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter/material.dart';

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
