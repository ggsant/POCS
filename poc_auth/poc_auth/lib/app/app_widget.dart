import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poc Atuh',
      theme: ThemeData(primarySwatch: Colors.pink),
      initialRoute: '/',
    ).modular();
  }
}
