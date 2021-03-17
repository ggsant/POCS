import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit(String name) : super(name);

  void change(String name) => emit(name);
}

class NameContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

class NameView extends StatelessWidget {
  final TextEditingController _nameController = new TextEditingController();

  // BlocBuilder<NameCubit, String>()
  @override
  Widget build(BuildContext context) {
    _nameController.text = context.read<NameCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Digita seu nome'),
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          RaisedButton(
            onPressed: () {
              final name = _nameController.text;
              context.read<NameCubit>().change(name);
              Navigator.pop(context);
            },
            child: Text('mudar'),
          )
        ],
      ),
    );
  }
}
