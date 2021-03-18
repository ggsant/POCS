import 'package:flutter/material.dart';
import 'package:poc_bloc/src/app/view/settings/theme_change.dart';
import 'package:poc_bloc/src/app/widgets/list_settings.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Configurações')),
      body: Column(
        children: [
          ListSettings(
            title: 'temas',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ThemeView()));
            },
          )
        ],
      ),
    );
  }
}
