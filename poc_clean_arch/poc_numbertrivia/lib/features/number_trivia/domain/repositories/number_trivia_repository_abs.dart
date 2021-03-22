import 'package:dartz/dartz.dart';
import 'package:poc_clean_arch/core/error/failures/failures.dart';
import 'package:poc_clean_arch/features/number_trivia/domain/entities/number_trivia_entity.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumberTrivia(
    int number,
  );
  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia();
}
