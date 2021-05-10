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

  var globalKeyForForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    credentialResult = widget.credentialResult ?? CredentialResult.empty();
    fnTitulo = FocusNode();
    fnAppId = FocusNode();
    fnToken = FocusNode();
    controller.observer(
      onState: (state) => Modular.to.pop<bool>(true),
      onError: (error) {
        final snackbar = SnackBar(
          content: Text(error.message),
          backgroundColor: Colors.red,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
    );
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
                onState: (_, state) => Form(
                  key: globalKeyForForm,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      CustomTextFormField(
                        labelText: 'Titulo',
                        hintText: 'Digite o titulo da sua notificação.',
                        focusNode: fnTitulo,
                        initialValue: credentialResult.title,
                        onFieldSubmitted: (term) {
                          fnTitulo.unfocus();
                          FocusScope.of(context).requestFocus(fnTitulo);
                        },
                        onChanged: (value) {
                          credentialResult = credentialResult.copyWith(title: value);
                        },
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        labelText: 'AppId',
                        hintText: 'Digite o AppId da sua aplicação.',
                        focusNode: fnAppId,
                        initialValue: credentialResult.appId,
                        onFieldSubmitted: (term) {
                          fnAppId.unfocus();
                          FocusScope.of(context).requestFocus(fnAppId);
                        },
                        onChanged: (value) {
                          credentialResult = credentialResult.copyWith(appId: value);
                        },
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        labelText: 'Token',
                        hintText: 'Digite o token da sua aplicação.',
                        focusNode: fnToken,
                        initialValue: credentialResult.token,
                        onFieldSubmitted: (term) {
                          fnToken.unfocus();
                          FocusScope.of(context).requestFocus(fnToken);
                        },
                        onChanged: (value) {
                          credentialResult = credentialResult.copyWith(token: value);
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              controller.saveCredentials(credentialResult);
                            },
                            label: Text(credentialResult.id.isEmpty ? 'Salvar Credêncial' : 'Salvar edição'),
                            icon: Icon(Icons.save_alt),
                          ),
                          SizedBox(width: 20),
                          if (credentialResult.id.isNotEmpty)
                            ElevatedButton.icon(
                              onPressed: () {
                                controller.deleteCredentials(credentialResult);
                              },
                              label: Text('Excluir Credêncial'),
                              icon: Icon(Icons.delete),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
