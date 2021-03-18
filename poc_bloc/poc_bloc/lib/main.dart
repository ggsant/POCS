import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_bloc/src/app/view/home/home.dart';

import 'src/app/global/theme/bloc/theme_bloc.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  final ThemeState state = ThemeState();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThemeBloc(state),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildMaterialApp,
      ),
    );
  }

  MaterialApp _buildMaterialApp(BuildContext context, ThemeState state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Change Demo',
      theme: state.themeData,
      home: HomeView(),
    );
  }
}
