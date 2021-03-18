import 'package:hasura_connect/hasura_connect.dart';
import 'package:poc_bloc/src/data/hasura_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  static String url = 'https://hasura-make-a-list.herokuapp.com/v1/graphql';
  final _client = HasuraConnect(url);

  @override
  Future<List<Map>> getTarefas() async {
    final query = await _client.query(
      '''
        query {
          todo {
              id
              task
            }
          }
      ''',
    );
    return (query['data']['todo'] as List)
        .map((e) => {"task": e['task']})
        .toList();
  }

  Future<void> addTarefas(String task) async {
    _client.mutation(
      '''
         mutation MyMutation(\$task: String!) {
          insert_todo(objects: {task: \$task}) {
            affected_rows
          }
        }
      ''',
      variables: {"task": task},
    );
    print("dooo                    $task");
  }
}
