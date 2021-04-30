import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:poc_triple/app/features/home/domain/entities/random_event_entity.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/core/errors/failures/failures.dart';
import 'app/core/http_client/http_client.dart';
import 'app/core/noparams/noparams.dart';
import 'app/features/home/data/datasources/random_event_datasource_abs.dart';
import 'app/features/home/data/datasources/random_event_datasource_impl.dart';
import 'app/features/home/data/repositories/random_event_repository_impl.dart';
import 'app/features/home/domain/repositories/random_event_repository.dart';
import 'app/features/home/domain/usecases/random_event_usecase.dart';

void main() async {
  ApiClient apiClient = ApiClient(client: Client());
  IRandomEventDatasource dataSource =
      RandomEventDatasourceImpl(client: apiClient);
  IRandomEventRepository movieRepository =
      RandomEventRepositoryImpl(remoteDataSource: dataSource);
  GetRandomEventUseCase getTrending =
      GetRandomEventUseCase(movieRepository);
  final Either<ServerFailure, RandomEventEntity> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold(
    (l) {
      //3
      print('error');
      print(l);
    },
    (r) {
      //4
      print('list of movies');
      print(r);
    },
  );
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
