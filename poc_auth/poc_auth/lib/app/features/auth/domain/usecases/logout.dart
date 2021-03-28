import 'package:poc_auth/app/core/errors/failures.dart';
import 'package:poc_auth/app/core/usecase/usecase.dart';
import 'package:poc_auth/app/features/auth/domain/entities/success_entity.dart';
import 'package:poc_auth/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase implements UseCase<SuccessEntity, NoParams> {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  @override
  Future<Either<Failure, SuccessEntity>> call(NoParams noParams) {
    return repository.logout();
  }
}
