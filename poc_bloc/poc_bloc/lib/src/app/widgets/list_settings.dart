import 'package:flutter/material.dart';

class ListSettings extends StatelessWidget {
  final String title;
  final Function onTap;
  const ListSettings({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
