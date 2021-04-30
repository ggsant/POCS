import 'package:poc_triple/app/features/home/domain/repositories/random_event_repository.dart';
import 'package:poc_triple/app/features/home/domain/entities/random_event_entity.dart';
import 'package:poc_triple/app/core/errors/failures/failures.dart';
import 'package:poc_triple/app/core/noparams/noparams.dart';
import 'package:poc_triple/app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetRandomEventUseCase extends UseCase<RandomEventEntity, NoParams> {
  final IRandomEventRepository repository;

  GetRandomEventUseCase(this.repository);

  @override
  Future<Either<ServerFailure, RandomEventEntity>> call(
      NoParams noParams) async {
    return await repository.getRandomEvent();
  }
}
