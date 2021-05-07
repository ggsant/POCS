import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String initialValue;
  final String labelText;
  final String hintText;

  final Function(String) onChanged;
  final FocusNode focusNode;
  final Function(String) onFieldSubmitted;

  const CustomTextFormField({
    Key? key,
    required this.initialValue,
    required this.onChanged,
    required this.focusNode,
    required this.onFieldSubmitted,
    required this.labelText,
    required this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      focusNode: focusNode,
      autofocus: true,
      enabled: true,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(229, 75, 77, 1)),
        ),
      ),
    );
  }
}
