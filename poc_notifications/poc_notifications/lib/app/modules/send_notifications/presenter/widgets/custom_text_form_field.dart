import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;

  final Function(String) onChanged;
  final String initialValue;

  const CustomTextFormField({
    Key? key,
    required this.onChanged,
    required this.labelText,
    required this.hintText,
    required this.initialValue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autofocus: true,
      textInputAction: TextInputAction.next,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(229, 75, 77, 1))),
      ),
    );
  }
}
