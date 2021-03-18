import 'package:flutter/material.dart';
import 'package:poc_bloc/src/app/view/settings/settings_view.dart';
import 'package:poc_bloc/src/app/widgets/add_task.dart';
import 'package:poc_bloc/src/data/hasura_repository_impl.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final repository = HomeRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: FutureBuilder<List<Map>>(
          future: repository.getTarefas(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Error Fetching Data");
            } else if (snapshot.hasData) {
              final list = snapshot.data;
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(list[index]['task']),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Home'),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SettingsView()));
          },
        ),
        InkWell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.add),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTask()),
            );
          },
        ),
      ],
    );
  }
}
