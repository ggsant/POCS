import 'package:amplitude_poc/app_state.dart';
import 'package:amplitude_poc/pages/page01.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onPressed() {
    AppState.of(context).logEvent(
      EventType.BUTTON_PRESSED,
      'HomePage._onPressed',
    );

    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return PageOne();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Amplitude')),
      body: Center(
        child: RaisedButton.icon(
          onPressed: _onPressed,
          icon: Icon(Icons.adb_rounded, color: Colors.white),
          label: Text('Iniciar Fluxo', style: TextStyle(color: Colors.white)),
          color: Colors.pink,
        ),
      ),
    );
  }
}


AmplitudeState.of(context).logEvent(
      ActionType.NAVIGATION,
      'navbar-requests',
    );
    print(
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa------------------------------------');