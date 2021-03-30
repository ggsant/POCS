import 'package:poc_auth/app/core/utils/theme_colors.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatelessWidget {
  const CustomForm({
    Key? key,
    required this.textController,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    required this.validator,
    required this.labelText,
    required this.sufixColor,
    required this.obscureText,
  }) : super(key: key);

  final TextEditingController textController;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final String hintText;
  final String labelText;
  final Color sufixColor;
  final bool obscureText;

  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: ThemeColors.darkBlue, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: ThemeColors.darkBlue, width: 1.5),
        ),
        hoverColor: ThemeColors.darkBlue,
        labelText: labelText,
        prefixIcon: Icon(
          prefixIcon,
          color: ThemeColors.darkBlue,
        ),
        suffixIcon: Icon(suffixIcon, color: sufixColor),
        hintText: hintText,
        hintStyle: TextStyle(),
      ),
    );
  }
}
