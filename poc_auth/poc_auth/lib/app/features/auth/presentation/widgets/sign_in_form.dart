import 'package:poc_auth/app/features/auth/presentation/controller/sign_in_controller.dart';
import 'package:poc_auth/app/core/utils/theme_colors.dart';
import 'package:poc_auth/app/core/utils/strings.dart';
import 'package:string_validator/string_validator.dart' as validators;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'custom_form.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final SignInController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Form(
        key: controller.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text(
              Strings.login,
              style: TextStyle(color: ThemeColors.darkBlue, fontSize: 30),
            ),
            SizedBox(height: 10),
            CustomForm(
              obscureText: false,
              textController: controller.textEmailController,
              hintText: 'Ex: email@email.com',
              prefixIcon: Icons.email,
              suffixIcon: Icons.check,
              sufixColor: ThemeColors.lightGreen,
              labelText: Strings.email,
              validator: (value) {
                if (!validators.isEmail(value!)) {
                  return 'Digite um e-mail valido';
                }
              },
            ),
            SizedBox(height: 10),
            CustomForm(
              obscureText: true,
              textController: controller.textPasswordController,
              hintText: 'Ex: *********',
              prefixIcon: Icons.lock,
              suffixIcon: Icons.visibility_off,
              sufixColor: ThemeColors.lightGreen,
              labelText: Strings.password,
              validator: (value) {
                if (!validators.isLength(value!, 6)) {
                  return 'Digite uma senha valida';
                }
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                controller.signInWithEmailAndPassword();
                Modular.to.pushNamed('/signInRoute');
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
                child: Text(Strings.enter, style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
