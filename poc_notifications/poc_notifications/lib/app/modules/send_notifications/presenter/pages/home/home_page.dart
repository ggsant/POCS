import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import '../credential_register/credential_register_store.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Credentials'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, HomeStore> {
  final controllerCredential = Modular.get<CredentialRegisterStore>();
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
      body: ScopedBuilder(
        store: controller,
        onLoading: (_) => Center(child: CircularProgressIndicator()),
        onState: (_, List<CredentialResult> state) {
          if (state.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(
                  state[index].title,
                  style: TextStyle(color: Colors.pink),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: controller.listCredentials.length,
            );
          } else {
            return Center(child: Text('Deu ruim'));
          }
        },
        onError: (context, error) => Center(child: Text('Deu ruim')),
      ),
    );
  }
}
