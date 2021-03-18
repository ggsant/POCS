import 'package:flutter/material.dart';

enum AppTheme { PinkLight, PinkDark, RedLight, RedDark }

final appThemeData = {
  AppTheme.PinkLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.pink,
  ),
  AppTheme.PinkDark: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.pink[700],
  ),
  AppTheme.RedLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
  ),
  AppTheme.RedDark: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red[700],
  ),
};
