import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_poc/api_key.dart';
import 'package:amplitude_poc/app_state.dart';
import 'package:flutter/material.dart';

import 'pages/homepage.dart';

class PocAmplitude extends StatefulWidget {
  @override
  _PocAmplitudeState createState() => _PocAmplitudeState();
}

class _PocAmplitudeState extends State<PocAmplitude> {
  Amplitude analytics;

  @override
  void initState() {
    super.initState();

    analytics = Amplitude.getInstance(instanceName: "poc_amplitude")
      ..setUseDynamicConfig(true)
      ..init(apiKey)
      ..enableCoppaControl()
      ..setUserId('user_poc')
      ..trackingSessionEvents(true)
      ..logEvent(
        'Initialize Analytics',
        eventProperties: {'initial_time': DateTime.now().toString()},
      );
  }

  @override
  Widget build(BuildContext context) {
    return AppState(
      analytics: analytics,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
