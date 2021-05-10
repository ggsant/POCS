import '../../../domain/entities/credentials_result.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter/material.dart';
import '../../utils/strings.dart';
import '../../utils/colors.dart';
import 'home_fetch_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = Strings.credentialTitle}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, HomeFetchStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: ThemeColors.background,
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.add), onPressed: fetchCredentials)],
      ),
      body: ScopedBuilder(
        store: controller,
        onLoading: (_) => Center(child: CircularProgressIndicator()),
        onError: (context, error) => Center(child: Text(Strings.genericError)),
        onState: (_, List<CredentialResult> state) {
          if (state.isNotEmpty) {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(state[index].title, style: TextStyle(color: ThemeColors.textColor)),
                leading: Icon(Icons.admin_panel_settings_rounded, color: ThemeColors.iconColor),
                trailing: Icon(Icons.keyboard_arrow_right, color: ThemeColors.iconColor),
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
            return Center(child: Text(Strings.newCredentialButton));
          }
        },
      ),
    );
  }

  void fetchCredentials() async {
    var result = (await Modular.to.pushNamed<bool>('/credential_register')) ?? false;
    if (result) {
      controller.fetchCredentials();
    }
  }
}
