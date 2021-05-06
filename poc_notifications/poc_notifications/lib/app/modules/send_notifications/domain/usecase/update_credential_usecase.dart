import 'package:dartz/dartz.dart';
import '../entities/credentials_result.dart';
import '../repositories/credential_repository.dart';
import '../errors/credentials_failures/credential_failures.dart';

class UpdateCredentialsUseCase {
  final CredentialRepository repository;

  const UpdateCredentialsUseCase(this.repository);

  Future<Either<CredentialFailures, Unit>> call(CredentialResult params) async {
    if (params.id.isEmpty) {
      return Left(const ValidationCredentialFailure('O id não pode ser vazio.'));
    } else if (params.title.isEmpty) {
      return Left(const ValidationCredentialFailure('O titulo não pode ser vazio.'));
    } else if (params.appId.isEmpty) {
      return Left(const ValidationCredentialFailure('O appId não pode ser vazio.'));
    } else if (params.token.isEmpty) {
      return Left(const ValidationCredentialFailure('O token não pode ser vazio.'));
    }

    return await repository.updateCredential(params);
  }
}
