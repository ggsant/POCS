import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/errors/credentials_failures/credential_failures.dart';

import 'credential_register_store.dart';

class CredentialRegisterPage extends StatefulWidget {
  final CredentialResult? credentialResult;

  const CredentialRegisterPage({Key? key, this.credentialResult}) : super(key: key);
  @override
  CredentialRegisterPageState createState() => CredentialRegisterPageState();
}

class CredentialRegisterPageState extends ModularState<CredentialRegisterPage, CredentialRegisterStore> {
  late CredentialResult credentialResult;

  @override
  void initState() {
    super.initState();
    credentialResult = widget.credentialResult ?? CredentialResult.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            initialValue: credentialResult.title,
            onChanged: (value) {
              credentialResult = credentialResult.copyWith(title: value);
            },
          ),
          TextFormField(
            initialValue: credentialResult.appId,
            onChanged: (value) {
              credentialResult = credentialResult.copyWith(appId: value);
            },
          ),
          TextFormField(
            initialValue: credentialResult.token,
            onChanged: (value) {
              credentialResult = credentialResult.copyWith(token: value);
            },
          ),
          ScopedBuilder(
            store: controller,
            onLoading: (_) => Center(child: CircularProgressIndicator()),
            onState: (_, state) => ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
            ),
            onError: (context, error) => Center(
              child: Text('Deu ruim'),
            ),
          )
        ],
      ),
    );
  }
}
