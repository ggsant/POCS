import 'package:poc_auth/app/features/auth/domain/entities/login_credentials.dart';
import 'package:poc_auth/app/features/auth/domain/entities/success_entity.dart';
import 'package:poc_auth/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:string_validator/string_validator.dart' as validator;

import 'package:poc_auth/app/core/errors/failures.dart';
import 'package:poc_auth/app/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class SignInWithEmailAndPassword
    implements UseCase<SuccessEntity, SignInCredentialsEntity> {
  final AuthRepository repository;

  SignInWithEmailAndPassword({required this.repository});

  @override
  Future<Either<Failure, SuccessEntity>> call(
      SignInCredentialsEntity params) async {
    bool isValidEmail = validator.isEmail(params.email);
    final int minLengthPassword = 6;

    if (!isValidEmail) {
      return Left(InvalidEmailFailure(message: 'Invalid email'));
    } else if (params.password.length <= minLengthPassword) {
      return Left(InvalidEmailFailure(message: 'Invalid password'));
    }

    return await repository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}
