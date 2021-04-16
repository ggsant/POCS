import 'package:amplitude_poc/app_state.dart';
import 'package:amplitude_poc/pages/page1.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Amplitude')),
      body: Center(
        child: RaisedButton.icon(
          onPressed: () {
            AppState.of(context)
              ..analytics.logEvent(
                'Pressed Button',
                eventProperties: {
                  'button_id': 'HomePage - Start flow',
                  'time_page01': DateTime.now().toString(),
                },
              )
              ..log('Update event - HomePage');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => PageOne(),
              ),
            );
          },
          icon: Icon(Icons.adb_rounded, color: Colors.white),
          label: Text('Iniciar Fluxo', style: TextStyle(color: Colors.white)),
          color: Colors.pink,
        ),
      ),
    );
  }
}
