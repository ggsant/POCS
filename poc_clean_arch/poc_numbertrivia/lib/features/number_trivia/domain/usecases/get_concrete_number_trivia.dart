import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:poc_clean_arch/core/error/failures/failures.dart';
import 'package:poc_clean_arch/core/usecases/usecase_impl.dart';
import 'package:poc_clean_arch/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:poc_clean_arch/features/number_trivia/domain/repositories/number_trivia_repository_abs.dart';

class GetConcreteNumberTriviaUsecase
    implements UseCase<NumberTriviaEntity, Params> {
  final NumberTriviaRepositoryAbs repository;
  GetConcreteNumberTriviaUsecase(this.repository);
  @override
  Future<Either<Failure, NumberTriviaEntity>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;
  Params({@required this.number});
  @override
  List<Object> get props => [number];
}
