import 'package:poc_auth/app/features/auth/data/models/succes_model.dart';
import 'package:poc_auth/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:poc_auth/app/features/auth/data/datasources/data_source.dart';
import 'package:poc_auth/app/core/connection/connectivity.dart';
import 'package:poc_auth/app/core/errors/failures.dart';
import 'package:poc_auth/app/core/errors/exeption.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImplementation implements AuthRepository {
  IDataSource remoteDataSource;

  AuthRepositoryImplementation({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, SuccessModel>> logout() async {
    try {
      final result = await remoteDataSource.logout();
      return Right(result);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message));
    } on CacheException catch (error) {
      return Left(CacheFailure(message: error.message));
    }
  }

  @override
  Future<Either<Failure, SuccessModel>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await remoteDataSource.signInWitEmailandPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } on ServerException catch (error) {
      return Left(ServerFailure(message: error.message));
    } on InvalidEmailException catch (error) {
      return Left(InvalidEmailFailure(message: error.message));
    } on InvalidPasswordException catch (error) {
      return Left(InvalidPasswordFailure(message: error.message));
    }
  }
}
