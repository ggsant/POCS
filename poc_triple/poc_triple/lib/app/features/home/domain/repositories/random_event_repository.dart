import 'package:dartz/dartz.dart';
import 'package:poc_triple/app/core/errors/failures/failures.dart';
import 'package:poc_triple/app/features/home/data/models/random_event_model.dart';

abstract class IRandomEventRepository {
  Future<Either<ServerFailure, RandomEventModel>> getRandomEvent();
}
