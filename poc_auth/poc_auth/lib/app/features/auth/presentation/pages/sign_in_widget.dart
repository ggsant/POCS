import 'package:poc_auth/app/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInWiget extends StatefulWidget {
  @override
  _SignInWigetState createState() => _SignInWigetState();
}

class _SignInWigetState extends State<SignInWiget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SignInForm(),
      ),
    );
  }
}
