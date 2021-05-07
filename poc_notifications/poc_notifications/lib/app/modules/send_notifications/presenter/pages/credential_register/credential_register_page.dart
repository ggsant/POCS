import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_notifications/app/modules/send_notifications/domain/entities/credentials_result.dart';
import 'package:poc_notifications/app/modules/send_notifications/presenter/widgets/custom_text_form_field.dart';

import 'credential_register_store.dart';

class CredentialRegisterPage extends StatefulWidget {
  final CredentialResult? credentialResult;

  const CredentialRegisterPage({Key? key, this.credentialResult}) : super(key: key);
  @override
  CredentialRegisterPageState createState() => CredentialRegisterPageState();
}

class CredentialRegisterPageState extends ModularState<CredentialRegisterPage, CredentialRegisterStore> {
  late CredentialResult credentialResult;

  final Color color = Color.fromRGBO(229, 75, 77, 1);

  late FocusNode fnTitulo;
  late FocusNode fnAppId;
  late FocusNode fnToken;

  @override
  void initState() {
    super.initState();
    credentialResult = widget.credentialResult ?? CredentialResult.empty();
    fnTitulo = FocusNode();
    fnAppId = FocusNode();
    fnToken = FocusNode();
  }

  @override
  void dispose() {
    fnTitulo.dispose();
    fnAppId.dispose();
    fnToken.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credential Register'),
        backgroundColor: color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ScopedBuilder(
                store: controller,
                onLoading: (_) => Center(child: CircularProgressIndicator()),
                onState: (_, state) => Column(
                  children: [
                    SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Titulo',
                      hintText: 'Digite o titulo da sua notificação.',
                      focusNode: fnTitulo,
                      onFieldSubmitted: (term) {
                        fnTitulo.unfocus();
                        FocusScope.of(context).requestFocus(fnTitulo);
                      },
                      initialValue: credentialResult.title,
                      onChanged: (value) {
                        credentialResult = credentialResult.copyWith(title: value);
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'AppId',
                      hintText: 'Digite o AppId da sua aplicação.',
                      focusNode: fnAppId,
                      onFieldSubmitted: (term) {
                        fnAppId.unfocus();
                        FocusScope.of(context).requestFocus(fnAppId);
                      },
                      initialValue: credentialResult.appId,
                      onChanged: (value) {
                        credentialResult = credentialResult.copyWith(appId: value);
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Token',
                      hintText: 'Digite o token da sua aplicação.',
                      focusNode: fnToken,
                      onFieldSubmitted: (term) {
                        fnToken.unfocus();
                        FocusScope.of(context).requestFocus(fnToken);
                      },
                      initialValue: credentialResult.token,
                      onChanged: (value) {
                        credentialResult = credentialResult.copyWith(token: value);
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text('Plus One'),
                      icon: Icon(Icons.add),
                    )
                  ],
                ),
                onError: (context, error) => Center(
                  child: Text('Salvar credencial'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
