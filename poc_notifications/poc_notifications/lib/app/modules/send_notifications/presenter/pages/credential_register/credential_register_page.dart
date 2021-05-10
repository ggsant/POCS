import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../../domain/entities/credentials_result.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_text_form_field.dart';

import 'credential_register_store.dart';

class CredentialRegisterPage extends StatefulWidget {
  final CredentialResult? credentialResult;

  const CredentialRegisterPage({Key? key, this.credentialResult}) : super(key: key);
  @override
  CredentialRegisterPageState createState() => CredentialRegisterPageState();
}

class CredentialRegisterPageState extends ModularState<CredentialRegisterPage, CredentialRegisterStore> {
  late CredentialResult credentialResult;

  var globalKeyForForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    credentialResult = widget.credentialResult ?? CredentialResult.empty();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(credentialResult.id.isEmpty ? Strings.credentialRegisterTitle : Strings.credentialEditTitle),
          backgroundColor: ThemeColors.background),
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
                        labelText: Strings.titlelabelText,
                        hintText: Strings.titleHintText,
                        initialValue: credentialResult.title,
                        onChanged: (value) {
                          credentialResult = credentialResult.copyWith(title: value);
                        },
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        labelText: Strings.appIdlabelText,
                        hintText: Strings.appIdHintText,
                        initialValue: credentialResult.appId,
                        onChanged: (value) {
                          credentialResult = credentialResult.copyWith(appId: value);
                        },
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        labelText: Strings.tokenlabelText,
                        hintText: Strings.tokenHintText,
                        initialValue: credentialResult.token,
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
                            label: Text(credentialResult.id.isEmpty ? Strings.buttonSaveCredential : Strings.buttonSaveEditCredential),
                            icon: Icon(Icons.save_alt),
                          ),
                          SizedBox(width: 20),
                          if (credentialResult.id.isNotEmpty)
                            ElevatedButton.icon(
                              onPressed: () {
                                controller.deleteCredentials(credentialResult);
                              },
                              label: Text(Strings.buttonDeleteCredential),
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
