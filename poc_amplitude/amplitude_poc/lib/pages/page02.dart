import 'package:amplitude_poc/pages/page03.dart';
import 'package:amplitude_poc/pages/page04.dart';
import 'package:amplitude_poc/pages/page05.dart';
import 'package:amplitude_poc/pages/page06.dart';
import 'package:amplitude_poc/pages/page07.dart';
import 'package:amplitude_poc/pages/page08.dart';
import 'package:flutter/material.dart';

import '../app_state.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina 02 do fluxo')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
              onPressed: () {
                AppState.of(context)
                  ..analytics.logEvent(
                    'Pressed Button',
                    eventProperties: {
                      'button_id': 'Botão 01',
                      'time_page01': DateTime.now().toString()
                    },
                  )
                  ..log('Update event - Page02');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageTree(),
                  ),
                );
              },
              icon: Icon(Icons.adb_rounded, color: Colors.white),
              label: Text('Botão 01', style: TextStyle(color: Colors.white)),
              color: Colors.pink,
            ),
            RaisedButton.icon(
              onPressed: () {
                AppState.of(context)
                  ..analytics.logEvent(
                    'Pressed Button',
                    eventProperties: {
                      'button_id': 'Botão 02',
                      'time_page01': DateTime.now().toString()
                    },
                  )
                  ..log('Update event - Page02');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageFour(),
                  ),
                );
              },
              icon: Icon(Icons.adb_rounded, color: Colors.white),
              label: Text('Botão 02', style: TextStyle(color: Colors.white)),
              color: Colors.pink,
            ),
            RaisedButton.icon(
              onPressed: () {
                AppState.of(context)
                  ..analytics.logEvent(
                    'Pressed Button',
                    eventProperties: {
                      'button_id': 'Botão 03',
                      'time_page01': DateTime.now().toString()
                    },
                  )
                  ..log('Update event - Page02');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageFive(),
                  ),
                );
              },
              icon: Icon(Icons.adb_rounded, color: Colors.white),
              label: Text('Botão 04', style: TextStyle(color: Colors.white)),
              color: Colors.deepOrange,
            ),
            RaisedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageEigth(),
                  ),
                );
              },
              icon: Icon(Icons.adb_rounded, color: Colors.white),
              label: Text('Botão 04', style: TextStyle(color: Colors.white)),
              color: Colors.lightBlueAccent,
            ),
            RaisedButton.icon(
              onPressed: () {
                AppState.of(context)
                  ..analytics.logEvent(
                    'Pressed Button',
                    eventProperties: {
                      'button_id': 'Botão 05',
                      'time_page01': DateTime.now().toString()
                    },
                  )
                  ..log('Update event - Page02');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageSix(),
                  ),
                );
              },
              icon: Icon(Icons.adb_rounded, color: Colors.white),
              label: Text('Botão 05', style: TextStyle(color: Colors.white)),
              color: Colors.indigoAccent,
            ),
            RaisedButton.icon(
              onPressed: () {
                AppState.of(context)
                  ..analytics.logEvent(
                    'Pressed Button',
                    eventProperties: {
                      'button_id': 'Botão 06',
                      'time_page01': DateTime.now().toString()
                    },
                  )
                  ..log('Update event - Page02');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageSeven(),
                  ),
                );
              },
              icon: Icon(Icons.adb_rounded, color: Colors.white),
              label: Text('Botão 06', style: TextStyle(color: Colors.white)),
              color: Colors.cyan,
            ),
            RaisedButton.icon(
              onPressed: () {
                AppState.of(context)
                  ..analytics.logEvent(
                    'Pressed Button',
                    eventProperties: {
                      'button_id': 'Botão 01',
                      'time_page01': DateTime.now().toString()
                    },
                  )
                  ..log('Update event - Page07');

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => PageEigth(),
                  ),
                );
              },
              icon: Icon(Icons.adb_rounded, color: Colors.white),
              label: Text('Finalizar', style: TextStyle(color: Colors.black)),
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

class Person {
  final String nome;
  final int quantidade;

  Person(
    this.nome,
    this.quantidade,
  );

  @override
  String toString() {
    return 'Person{nome: $nome, quantidade: $quantidade,}';
  }
}
