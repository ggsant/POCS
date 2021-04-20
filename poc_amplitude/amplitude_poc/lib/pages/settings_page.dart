import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _coolConfig = 'OK';

  void _updateCoolConfig(String config) {
    print(config);
    Navigator.of(context).pop();
    setState(() {
      _coolConfig = config;
    });
  }

  void _showConfigModal() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 200,
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _updateCoolConfig('OK'),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'OK',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Divider(height: 0.0, thickness: 2.0, color: Colors.black),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _updateCoolConfig('NÃO OK'),
                    child: Container(
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'NÃO OK',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Configuração bacana'),
              Switch(
                value: true,
                onChanged: (value) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Configuração maneira'),
              FlatButton(
                padding: const EdgeInsets.all(8.0),
                onPressed: _showConfigModal,
                color: Colors.grey[350],
                minWidth: 60.0,
                child: Text(
                  _coolConfig,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
