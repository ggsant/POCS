import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'core/http_client/http_client.dart';
import 'features/home/data/datasources/random_event_datasource_impl.dart';
import 'features/home/data/repositories/random_event_repository_impl.dart';
import 'features/home/domain/usecases/random_event_usecase.dart';
import 'features/home/presentation/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => RandomEventRepositoryImpl(remoteDataSource: i())),
    Bind.singleton((i) => RandomEventDatasourceImpl(client: i())),
    Bind.singleton((i) => GetRandomEventUseCase(i())),
    Bind.singleton((i) => ApiClient(client: i())),
    Bind.singleton((i) => http.Client()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
