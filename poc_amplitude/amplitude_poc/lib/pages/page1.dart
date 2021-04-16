import 'package:amplitude_poc/pages/page02.dart';
import 'package:flutter/material.dart';

import '../app_state.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorIdade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 01 do fluxo'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            AppState.of(context)
              ..analytics.logEvent(
                'Pressed Button',
                eventProperties: {
                  'button_id': 'Page01 - voltar',
                  'time_page01': DateTime.now().toString()
                },
              )
              ..log('Update event - Page01 - voltar');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controladorNome,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _controladorIdade,
              decoration: InputDecoration(labelText: 'idade'),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                color: Colors.pink,
                child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  final String nome = _controladorNome.text;
                  final int quantidade = int.tryParse(_controladorIdade.text);

                  final Person newPerson = Person(nome, quantidade);
                  print(newPerson);

                  AppState.of(context)
                    ..analytics.logEvent(
                      'Pressed Button',
                      eventProperties: {
                        'button_id': 'Page01 - Cadastro',
                        'time_page01': DateTime.now().toString()
                      },
                    )
                    ..log('Update event - Page01');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => PageTwo(),
                    ),
                  );
                },
              ),
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
