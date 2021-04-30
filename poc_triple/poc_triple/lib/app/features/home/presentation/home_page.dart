import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_triple/app/core/errors/failures/failures.dart';
import 'package:poc_triple/app/features/home/domain/entities/random_event_entity.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  Widget _buildError(Failure error) {
    if (error is ServerFailure) {
      return Center(
        child: Text('Algo errado aconteceu'),
      );
    } else if (error is NoConnectionFailure) {
      return Center(
        child: Text('Voce esta sem conexao'),
      );
    } else {
      return Center(
        child: Text('Deu ruim'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: ScopedBuilder<HomeStore, ServerFailure, RandomEventEntity>(
        store: controller,
        onLoading: (_) => Center(child: CircularProgressIndicator()),
        onState: (_, state) {
          return Column(
            children: [
              Text(state.activity),
              // Text(state.participants.toString()),
              // Text(state.accessibility.toString()),
            ],
          );
        },
        onError: (context, error) {
          return _buildError(error!);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
