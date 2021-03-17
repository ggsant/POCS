import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presenter/screens/change_name/change_name.dart';
import 'presenter/screens/dashboard.dart';
import 'presenter/theme/theme.dart';

void main() {
  runApp(BytebankApp());
}

class LogObserver extends BlocObserver {
  @override
  void onChange(Cubit cubit, Change change) {
    print("${cubit.runtimeType} > $change");
    super.onChange(cubit, change);
  }
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Bloc.observer = LogObserver();
    return MaterialApp(
      theme: appTheme,
      home: DashboardContainer(),
      // home: NameContainer(),
    );
  }
}
