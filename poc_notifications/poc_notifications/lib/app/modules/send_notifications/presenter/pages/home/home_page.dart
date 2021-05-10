import '../../../domain/entities/credentials_result.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter/material.dart';
import 'fetch_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = 'Credênciais'}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, FetchStore> {
  final Color color = Color.fromRGBO(229, 75, 77, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: color,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              var result = (await Modular.to.pushNamed<bool>('/credential_register')) ?? false;
              if (result) {
                controller.fetchCredentials();
              }
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
                title: Text(state[index].title, style: TextStyle(color: Colors.black)),
                leading: Icon(Icons.admin_panel_settings_rounded, color: Colors.orangeAccent),
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.orangeAccent),
                onLongPress: () async {
                  var result = (await Modular.to.pushNamed<bool>('/credential_register', arguments: state[index])) ?? false;
                  if (result) {
                    controller.fetchCredentials();
                  }
                },
                onTap: () => Modular.to.pushNamed('/notification_page', arguments: state[index]),
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: controller.state.length,
            );
          } else {
            return Center(child: Text('Adicione uma nova credencial clicando no +'));
          }
        },
        onError: (context, error) => Center(child: Text('Deu ruim')),
      ),
    );
  }
}
