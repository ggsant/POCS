import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_bloc/src/app/global/theme/bloc/theme.dart';
import 'package:poc_bloc/src/app/global/theme/theme.dart';

class ThemeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temas'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          final itemAppTheme = AppTheme.values[index];
          final nameTheme = AppTheme.values[index].toString();
          return GestureDetector(
            onTap: () {
              BlocProvider.of<ThemeBloc>(context)
                  .add(ThemeChanged(theme: itemAppTheme));
            },
            child: Card(
              color: appThemeData[itemAppTheme].primaryColor,
              child: Center(
                child: Text(
                  nameTheme.substring(9),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
