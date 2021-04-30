import 'package:flutter/material.dart';

import '../app_state.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  static const List<Color> colors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.cyan,
    Colors.teal,
    Colors.green,
  ];

  void _onButtonPressed(BuildContext context, String buttonId, Color color) {
    AppState.of(context).logEvent(
      EventType.BUTTON_PRESSED,
      buttonId,
      message: buttonId,
    );

    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return ColoredPage(color: color);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Página 02 do fluxo')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(colors.length, (index) {
            return RaisedButton.icon(
              color: colors[index],
              icon: Icon(Icons.adb_rounded, color: Colors.white),
              onPressed: () {
                _onButtonPressed(context, 'button-${index + 1}', colors[index]);
              },
              label: Text(
                'Botão 0${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ColoredPage extends StatelessWidget {
  const ColoredPage({Key key, this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
