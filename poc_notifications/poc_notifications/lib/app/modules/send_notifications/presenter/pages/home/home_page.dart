import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import '../credential_register/credential_register_store.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Credentials'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, HomeStore> {
  final CredentialRegisterStore controllerCredential = Modular.get();
  final Color color = Color.fromRGBO(229, 75, 77, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: color,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Modular.to.pushNamed('/credential_register');
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
