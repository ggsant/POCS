import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:poc_clean_arch/core/error/exception/exeptions.dart';
import 'package:poc_clean_arch/core/error/failures/failures.dart';
import 'package:poc_clean_arch/core/platform/network_info.dart';
import 'package:poc_clean_arch/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:poc_clean_arch/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:poc_clean_arch/features/number_trivia/domain/entities/number_trivia_entity.dart';
import 'package:poc_clean_arch/features/number_trivia/domain/repositories/number_trivia_repository_abs.dart';

typedef Future<NumberTriviaEntity> _ConcreteOrRandomChooser();

class NumberTriviaRepositoryImpl implements NumberTriviaRepositoryAbs {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumberTrivia(
    int number,
  ) async {
    return await _getTrivia(() {
      return remoteDataSource.getConcreteNumberTrivia(number);
    });
  }

  @override
  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return remoteDataSource.getRandomNumberTrivia();
    });
  }

  Future<Either<Failure, NumberTriviaEntity>> _getTrivia(
    _ConcreteOrRandomChooser getConcreteOrRandom,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
