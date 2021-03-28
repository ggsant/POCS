import 'package:poc_auth/app/core/errors/failures.dart';
import 'package:poc_auth/app/features/auth/domain/entities/success_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  AuthRepository(Object object);

  Future<Either<Failure, SuccessEntity>> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<Failure, SuccessEntity>> logout();
}
