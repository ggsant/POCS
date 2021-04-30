import 'package:dartz/dartz.dart';
import 'package:poc_triple/app/core/errors/exeptions/exeptions.dart';
import 'package:poc_triple/app/core/errors/failures/failures.dart';
import 'package:poc_triple/app/features/home/data/datasources/random_event_datasource_abs.dart';
import 'package:poc_triple/app/features/home/data/models/random_event_model.dart';
import 'package:poc_triple/app/features/home/domain/repositories/random_event_repository.dart';

class RandomEventRepositoryImpl implements IRandomEventRepository {
  final IRandomEventDatasource remoteDataSource;

  RandomEventRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerFailure, RandomEventModel>> getRandomEvent() async {
    try {
      final activitys = await remoteDataSource.getRandomEvent();
      return Right(activitys);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
