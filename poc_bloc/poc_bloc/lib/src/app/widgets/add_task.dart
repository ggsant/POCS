import 'package:flutter/material.dart';
import 'package:poc_bloc/src/data/hasura_repository_impl.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController controller = TextEditingController();

  final repository = HomeRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter a search term',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          repository.addTarefas(controller.text.toString());
          Navigator.pop(context);
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
