import 'package:amplitude_poc/app_state.dart';
import 'package:amplitude_poc/pages/page01.dart';
import 'package:amplitude_poc/resources/strings.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    Key key,
  }) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  void _startFlow() {
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
    return Center(
      child: RaisedButton.icon(
        onPressed: _startFlow,
        icon: Icon(Icons.adb_rounded, color: Colors.white),
        color: Colors.pink,
        label: Text(
          Strings.START_FLOW,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
