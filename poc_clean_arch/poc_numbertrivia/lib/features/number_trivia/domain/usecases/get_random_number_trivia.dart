import 'package:dartz/dartz.dart';
import 'package:poc_clean_arch/core/error/failures/failures.dart';
import 'package:poc_clean_arch/core/usecases/usecase_impl.dart';
import 'package:poc_clean_arch/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:poc_clean_arch/features/number_trivia/domain/repositories/number_trivia_repository_abs.dart';

class GetRandomNumberTriviaUsecase
    implements UseCase<NumberTriviaEntity, NoParams> {
  final NumberTriviaRepositoryAbs repository;

  GetRandomNumberTriviaUsecase(this.repository);

  @override
  Future<Either<Failure, NumberTriviaEntity>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
